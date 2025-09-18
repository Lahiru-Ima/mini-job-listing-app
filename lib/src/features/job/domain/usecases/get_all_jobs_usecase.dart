import 'package:dartz/dartz.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';
import 'package:job_listing_app/src/core/usecases/usecase.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';
import 'package:job_listing_app/src/features/job/domain/repositories/job_repository.dart';

class GetAllJobsUseCase implements UseCase<List<JobEntity>, NoParams> {
  final JobRepository repository;

  GetAllJobsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<JobEntity>>> call(NoParams params) async {
    return await repository.getAllJobs();
  }
}


