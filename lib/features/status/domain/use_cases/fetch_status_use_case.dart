import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';
import 'package:flowerlly_app/core/utils/use_cases/status_use_cases_method.dart';

import 'package:flowerlly_app/features/status/domain/entities/status_entity.dart';
import 'package:flowerlly_app/features/status/domain/repos/status_repos.dart';

class FetchStatusUseCase extends StatusUseCasesMethod<List<StatusEntity>> {
  StatusRepos statusRepos;
  FetchStatusUseCase({required this.statusRepos});

  @override
Either<Failure, List<StatusEntity>> call() {
    return statusRepos.fetchItems();
  }
}
