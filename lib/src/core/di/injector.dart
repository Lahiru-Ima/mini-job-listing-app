import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:job_listing_app/src/core/network/dio_client.dart';
import 'package:job_listing_app/src/core/network/network_info.dart';
import 'package:job_listing_app/src/features/job/data/datasources/job_local_datasource.dart';
import 'package:job_listing_app/src/features/job/data/datasources/job_remote_datasource.dart';
import 'package:job_listing_app/src/features/job/data/repositories/job_repository_impl.dart';
import 'package:job_listing_app/src/features/job/domain/repositories/job_repository.dart';
import 'package:job_listing_app/src/features/job/domain/usecases/get_all_jobs_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Network
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClient(public: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.createInstance());

  /// Feature: Jobs Listing

  // Usecases
  sl.registerLazySingleton<GetAllJobsUseCase>(() => GetAllJobsUseCase(repository: sl()));

  // Data sources
  sl.registerLazySingleton<JobRemoteDataSource>(() => JobRemoteDataSourceImpl(dioClient: sl()));
  sl.registerLazySingleton<JobLocalDataSource>(() => JobLocalDataSourceImpl(sharedPreferences: sl()));

  // Repositories
  sl.registerLazySingleton<JobRepository>(() => JobRepositoryImpl(networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));
}
