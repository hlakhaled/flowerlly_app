import 'package:dio/dio.dart';
import 'package:flowerlly_app/core/utils/api_service.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flowerlly_app/features/home/data/repos/home_repos_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeReposImpl>(HomeReposImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>())));
}
