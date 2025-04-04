import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';

abstract class HomeRepos {
  Future<Either<Failure, List<PlantEntity>>> fetchPlants(String q);
}
