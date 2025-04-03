import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/core/utils/use_cases/use_cases.dart';
import 'package:flowerlly_app/features/home/domain/entities/plant_details_entity.dart';
import 'package:flowerlly_app/features/home/domain/repos/plant_details_repos.dart';

class FetchPlantDetailsUseCase extends UseCases<PlantDetailsEntity, String> {
  PlantDetailsRepos plantDetailsRepos;
  FetchPlantDetailsUseCase({required this.plantDetailsRepos});
  @override
  Future<Either<Failure, PlantDetailsEntity>> call([String? id]) {
    return plantDetailsRepos.fetchPlantDetails(id!);
  }
}
