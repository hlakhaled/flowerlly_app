import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';

abstract class StatusRepos {
  Either<Failure, List<StatusEntity>> fetchItems();
}
