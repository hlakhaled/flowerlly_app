import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/features/status/data/data_sources/status_data_sources/status_local_data_sources.dart';
import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/domain/repos/status_repos.dart';

class StatusReposImpl extends StatusRepos {
  StatusLocalDataSources statusLocalDataSources;
  StatusReposImpl({required this.statusLocalDataSources});
  @override
  Either<Failure, List<StatusEntity>> fetchItems() {
    try {

      return right(statusLocalDataSources.fetchStatus());
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return left(ServiceFailure(e.toString()));
      }
    }
  }
}
