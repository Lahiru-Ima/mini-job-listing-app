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

  JobBloc({required this.getAllJobsUseCase}) : super(const JobState(status: BlocStateStatus.initial)) {
    on<GetJobsEvent>(_onGetJobsEvent);
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
        print(dataList);
        emit(state.copyWith(status: BlocStateStatus.loadSuccess, jobData: dataList));
      },
    );
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
