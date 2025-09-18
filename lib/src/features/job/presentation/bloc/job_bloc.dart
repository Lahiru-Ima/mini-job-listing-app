import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';
import 'package:job_listing_app/src/core/usecases/usecase.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';
import 'package:job_listing_app/src/features/job/domain/usecases/get_all_jobs_usecase.dart';

part 'job_event.dart';

part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetAllJobsUseCase getAllJobsUseCase;
  List<JobEntity> _allJobs = [];

  JobBloc({required this.getAllJobsUseCase}) : super(const JobState(status: BlocStateStatus.initial)) {
    on<GetJobsEvent>(_onGetJobsEvent);
    on<SearchJobsEvent>(_onSearchJobsEvent);
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
