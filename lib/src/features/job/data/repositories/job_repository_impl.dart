import 'package:dartz/dartz.dart';
import 'package:job_listing_app/src/core/errors/exception.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';
import 'package:job_listing_app/src/core/network/network_info.dart';
import 'package:job_listing_app/src/features/job/data/datasources/job_local_datasource.dart';
import 'package:job_listing_app/src/features/job/data/datasources/job_remote_datasource.dart';
import 'package:job_listing_app/src/features/job/data/models/job_model.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';
import 'package:job_listing_app/src/features/job/domain/repositories/job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource remoteDataSource;
  final JobLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  const JobRepositoryImpl({required this.networkInfo, required this.remoteDataSource, required this.localDataSource});

  List<JobEntity> _convertModelsToEntities(List<JobModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final data = await remoteDataSource.getJobData();
        localDataSource.cacheJobData(data, cachedKey: 'JOB_LISTING_DATA');
        return Right(_convertModelsToEntities(data));
      } on ServerException catch (serverException) {
        return Left(ServerFailure(message: serverException.errorMessage));
      }
    } else {
      try {
        final data = await localDataSource.getCachedJobData(cachedKey: 'JOB_LISTING_DATA');
        return Right(_convertModelsToEntities(data));
      } on CacheException {
        return Left(NoConnectionFailure());
      }
    }
  }
}
