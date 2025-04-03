import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/home/data/data_sources/plant_details_data_sourcces/plant_details_local_data_source.dart';
import 'package:flowerlly_app/features/home/data/data_sources/plant_details_data_sourcces/plant_details_remote_data_source.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/plant_details_repos.dart';

class PlantDetailsReposImpl extends PlantDetailsRepos {
  PlantDetailsLocalDataSource plantDetailsLocalDataSource;
  PlantDetailsRemoteDataSource plantDetailsRemoteDataSource;

  PlantDetailsReposImpl(
      {required this.plantDetailsLocalDataSource,
      required this.plantDetailsRemoteDataSource});
  @override
  Future<Either<Failure, PlantDetailsEntity>> fetchPlantDetails(String id) async {
    try {
      var plant = plantDetailsLocalDataSource.fetchPlantDetails(id);
      if (plant != null) {
        return right(plant);
      }
      var plantRemote = await plantDetailsRemoteDataSource.fetchPlantDetails(id);
      return right(plantRemote);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}
