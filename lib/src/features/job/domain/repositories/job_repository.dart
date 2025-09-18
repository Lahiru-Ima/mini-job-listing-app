import 'package:dartz/dartz.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';

abstract class JobRepository {
    Future<Either<Failure, List<JobEntity>>> getAllJobs();
}
