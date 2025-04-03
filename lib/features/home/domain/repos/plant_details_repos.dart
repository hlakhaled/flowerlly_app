import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';

abstract class PlantDetailsRepos {
  Future<Either<Failure, PlantDetailsEntity>> fetchPlantDetails(String id);
}
