import 'package:dio/dio.dart';
import 'package:job_listing_app/src/core/errors/exception.dart';
import 'package:job_listing_app/src/core/network/dio_client.dart';
import 'package:job_listing_app/src/features/job/data/models/job_model.dart';

abstract class JobRemoteDataSource {
  Future<List<JobModel>> getJobData();
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final DioClient dioClient;

  JobRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<JobModel>> getJobData() async {
    try {
      Response response = await dioClient.public.get('/jobs');
      print(response.data);
      return jobModelFromJson(response.data);
    } on DioException catch (err) {
      throw ServerException.fromDioError(err);
    } catch (e) {
      throw ServerException(errorMessage: '$e', unexpectedError: true);
    }
  }
}
