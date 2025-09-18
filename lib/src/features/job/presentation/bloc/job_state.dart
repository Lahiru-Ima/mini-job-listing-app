part of 'job_bloc.dart';

class JobState extends Equatable {
  final BlocStateStatus status;
  final List<JobEntity>? jobData;
  final String? errorMessage;

  const JobState({required this.status, this.jobData, this.errorMessage});

  @override
  List<Object?> get props => [status, jobData, errorMessage];

  JobState copyWith({BlocStateStatus? status, List<JobEntity>? jobData, String? errorMessage}) {
    return JobState(status: status ?? this.status, jobData: jobData ?? this.jobData, errorMessage: errorMessage ?? this.errorMessage);
  }
}
