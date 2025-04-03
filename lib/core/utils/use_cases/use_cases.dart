import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';

abstract class UseCases<Type, parm> {
  Future<Either<Failure, Type>> call([parm p]);
  
}

class NoParm {}
