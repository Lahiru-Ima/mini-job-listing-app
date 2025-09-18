part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();
}

class GetJobsEvent extends JobEvent {
  const GetJobsEvent();

  @override
  List<Object> get props => [];
}

