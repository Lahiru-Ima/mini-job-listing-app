part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();
}

class GetJobsEvent extends JobEvent {
  const GetJobsEvent();

  @override
  List<Object> get props => [];
}

class SearchJobsEvent extends JobEvent {
  final String query;
  
  const SearchJobsEvent(this.query);
  
  @override
  List<Object> get props => [query];
}

class LoadFavoritesEvent extends JobEvent {
  const LoadFavoritesEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavoriteEvent extends JobEvent {
  final JobEntity job;
  
  const ToggleFavoriteEvent(this.job);
  
  @override
  List<Object> get props => [job];
}

class RemoveFavoriteEvent extends JobEvent {
  final String jobId;
  
  const RemoveFavoriteEvent(this.jobId);
  
  @override
  List<Object> get props => [jobId];
}

class ClearAllFavoritesEvent extends JobEvent {
  const ClearAllFavoritesEvent();

  @override
  List<Object> get props => [];
}

