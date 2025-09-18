import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';
import 'package:job_listing_app/src/core/usecases/usecase.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';
import 'package:job_listing_app/src/features/job/domain/usecases/get_all_jobs_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'job_event.dart';

part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetAllJobsUseCase getAllJobsUseCase;
  final SharedPreferences prefs;
  static const String _favoritesKey = 'favorite_jobs';
  List<JobEntity> _allJobs = [];

  JobBloc({required this.getAllJobsUseCase, required this.prefs}) : super(const JobState(status: BlocStateStatus.initial)) {
    on<GetJobsEvent>(_onGetJobsEvent);
    on<SearchJobsEvent>(_onSearchJobsEvent);
    on<LoadFavoritesEvent>(_onLoadFavoritesEvent);
    on<ToggleFavoriteEvent>(_onToggleFavoriteEvent);
    on<RemoveFavoriteEvent>(_onRemoveFavoriteEvent);
    on<ClearAllFavoritesEvent>(_onClearAllFavoritesEvent);
  }

  Future<void> _onGetJobsEvent(GetJobsEvent event, Emitter<JobState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loadInProgress));
    Either<Failure, List<JobEntity>> result = await getAllJobsUseCase(NoParams());
    result.fold(
      (failure) {
        final message = _getFailureMessage(failure);
        print('Error: $message');
        emit(state.copyWith(status: BlocStateStatus.loadFailure, errorMessage: message));
      },
      (dataList) {
        _allJobs = dataList;
        print(dataList);
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, jobData: dataList));

        add(const LoadFavoritesEvent());
      },
    );
  }

  Future<void> _onSearchJobsEvent(SearchJobsEvent event, Emitter<JobState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loadInProgress));

    try {
      if (event.query.isEmpty) {
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, jobData: _allJobs));
      } else {
        final filteredJobs = _allJobs.where((job) {
          final query = event.query.toLowerCase();
          final title = job.title.toLowerCase();
          final location = job.location.toLowerCase();

          return title.contains(query) || location.contains(query);
        }).toList();

        emit(state.copyWith(status: BlocStateStatus.loadSuccess, jobData: filteredJobs));
      }
    } catch (error) {
      emit(state.copyWith(status: BlocStateStatus.loadFailure, errorMessage: 'Search failed: ${error.toString()}'));
    }
  }

  Future<void> _onLoadFavoritesEvent(LoadFavoritesEvent event, Emitter<JobState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      final favoriteJobs = favoritesJson.map((jsonString) {
        final jobMap = json.decode(jsonString) as Map<String, dynamic>;
        return JobEntity.fromJson(jobMap);
      }).toList();

      emit(state.copyWith(favoriteJobs: favoriteJobs));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to load favorites'));
    }
  }

  Future<void> _onToggleFavoriteEvent(ToggleFavoriteEvent event, Emitter<JobState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentFavorites = List<JobEntity>.from(state.favoriteJobs);

      if (state.favoriteJobs.any((job) => job.id == event.job.id)) {
        currentFavorites.removeWhere((job) => job.id == event.job.id);
      } else {
        currentFavorites.add(event.job);
      }

      final favoritesJson = currentFavorites.map((job) => json.encode(job.toJson())).toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);

      emit(state.copyWith(favoriteJobs: currentFavorites));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to update favorites'));
    }
  }

  Future<void> _onRemoveFavoriteEvent(RemoveFavoriteEvent event, Emitter<JobState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final currentFavorites = state.favoriteJobs.where((job) => job.id != event.jobId).toList();

      final favoritesJson = currentFavorites.map((job) => json.encode(job.toJson())).toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);

      emit(state.copyWith(favoriteJobs: currentFavorites));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to remove favorite'));
    }
  }

  Future<void> _onClearAllFavoritesEvent(ClearAllFavoritesEvent event, Emitter<JobState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_favoritesKey);
      emit(state.copyWith(favoriteJobs: []));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to clear favorites'));
    }
  }

  String _getFailureMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoConnectionFailure) {
      return 'No Connection failure';
    } else {
      return 'Unexpected error';
    }
  }
}
