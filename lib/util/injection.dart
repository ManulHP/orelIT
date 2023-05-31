import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../common/network/dioClient.dart';
import '../common/network/internet_connectivity.dart';
import '../feature/data/datasource/newRemoteDataSource.dart';
import '../feature/data/repository/new_repository_impl.dart';
import '../feature/domain/repository/newRepository.dart';
import '../feature/domain/usecase/get_news.dart';
import '../feature/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocators() async {
  sl.registerFactory<Dio>(() => Dio());
  sl.registerFactory<DioClient>(() => DioClient(public: sl<Dio>()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  // Blocs
  sl.registerFactory<NewsBloc>(() => NewsBloc(getNewsUseCase: sl()));
  // Use Cases
  sl.registerLazySingleton<GetNewsUseCase>(() => GetNewsUseCase(repository: sl()));
  // Repositories
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl( remoteDataSource: sl(), networkInfo: sl()));
  // Data Sources
  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(dioClient: sl()));

}