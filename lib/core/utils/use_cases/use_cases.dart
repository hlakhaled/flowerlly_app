import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';

abstract class UseCases<Type, parm> {
  Future<Either<List<Type>, Failure>> call([parm p]);
}

class NoParm {}
