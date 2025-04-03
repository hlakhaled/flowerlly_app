import 'package:dio/dio.dart';
import 'package:flowerlly_app/core/utils/api_service.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_data_sources/home_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_data_sources/home_remote_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/plant_details_data_sourcces/plant_details_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/plant_details_data_sourcces/plant_details_remote_data_source.dart';
import 'package:flowerlly_app/features/home/data/repos/home_repos_impl.dart';
import 'package:flowerlly_app/features/home/data/repos/plant_details_repos_impl.dart';
import 'package:flowerlly_app/features/home/domain/repos/plant_details_repos.dart';
import 'package:flowerlly_app/features/status/data/data_sources/status_data_sources/status_local_data_sources.dart';
import 'package:flowerlly_app/features/status/data/repos/status_repos_impl.dart';
import 'package:flowerlly_app/features/status/domain/repos/status_repos.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeReposImpl>(HomeReposImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>())));

  getIt.registerSingleton<StatusRepos>(
    StatusReposImpl(statusLocalDataSources: StatusLocalDataSourcesImpl()),
  );
  getIt.registerSingleton<PlantDetailsRepos>(PlantDetailsReposImpl(
      plantDetailsLocalDataSource: PlantDetailsLocalDataSourceimpl(),
      plantDetailsRemoteDataSource: PlantDetailsRemoteDataSourceImpl(
          apiService: getIt.get<ApiService>())));
}
