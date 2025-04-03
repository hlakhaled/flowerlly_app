import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_data_sources/home_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_data_sources/home_remote_data_source.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/home_repos.dart';

class HomeReposImpl extends HomeRepos {
  HomeLocalDataSource homeLocalDataSource;
  HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<PlantEntity>>> fetchPlants(String q) async {
    try {
      var plantList = homeLocalDataSource.fetchPlants();

      if (plantList.isNotEmpty) {
        return right(plantList);
      }

      var plant = await homeRemoteDataSource.fetchPlants(q: q);

      return right(plant);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return left(ServiceFailure(e.toString()));
      }
    }
  }
}
