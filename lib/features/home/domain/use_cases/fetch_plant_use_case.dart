import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/core/utils/use_cases/use_cases.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/home_repos.dart';

class FetchPlantUseCase extends UseCases<List<PlantEntity>, String> {
  final HomeRepos homeRepos;

  FetchPlantUseCase({required this.homeRepos});

  @override
  Future<Either<Failure, List<PlantEntity>>> call([String? p]) {
    return homeRepos.fetchPlants(p as String);
  }
}
