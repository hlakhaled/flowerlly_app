import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/home_repos.dart';

class HomeReposImpl extends HomeRepos {
  HomeLocalDataSource homeLocalDataSource;
  HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<PlantEntity>>> fetchPlants() async {
    try {
      List<PlantEntity> plant = homeLocalDataSource.fetchPlants();
      if (plant.isNotEmpty) {
        return right(plant);
      }

      plant = await homeRemoteDataSource.fetchPlants();
      return right(plant);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return left(ServiceFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<PlantEntity>>> fetchaCategoryOfPlants() async {
    try {
      List<PlantEntity> plant = homeLocalDataSource.fetchaCategoryOfPlants();
      if (plant.isNotEmpty) {
        return right(plant);
      }

      plant = await homeRemoteDataSource.fetchaCategoryOfPlants();
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
