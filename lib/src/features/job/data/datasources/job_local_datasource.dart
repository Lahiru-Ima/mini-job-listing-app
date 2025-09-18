import 'package:job_listing_app/src/core/errors/exception.dart';
import 'package:job_listing_app/src/features/job/data/models/job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class JobLocalDataSource {
  Future<List<JobModel>> getCachedJobData({required String cachedKey});

  Future<void> cacheJobData(List<JobModel> jobModels, {required String cachedKey});
}

class JobLocalDataSourceImpl implements JobLocalDataSource {
  final SharedPreferences sharedPreferences;

  const JobLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheJobData(List<JobModel> jobModels, {required String cachedKey}) async {
    sharedPreferences.setString(cachedKey, jobModelToJson(jobModels));
  }

  @override
  Future<List<JobModel>> getCachedJobData({required String cachedKey}) async {
    final jsonString = sharedPreferences.getString(cachedKey);
    if (jsonString != null) {
      return Future.value(jobModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }
}
