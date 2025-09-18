part of 'job_bloc.dart';

class JobState extends Equatable {
  final BlocStateStatus status;
  final List<JobEntity>? jobData;
  final List<JobEntity> favoriteJobs;
  final String? errorMessage;

  const JobState({required this.status, this.jobData, this.favoriteJobs = const [], this.errorMessage});

  @override
  List<Object?> get props => [status, jobData, favoriteJobs, errorMessage];

  JobState copyWith({BlocStateStatus? status, List<JobEntity>? jobData, List<JobEntity>? favoriteJobs, String? errorMessage}) {
    return JobState(status: status ?? this.status, jobData: jobData ?? this.jobData, favoriteJobs: favoriteJobs ?? this.favoriteJobs, errorMessage: errorMessage ?? this.errorMessage);
  }
}
