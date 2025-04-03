import 'package:dartz/dartz.dart';
import 'package:flowerlly_app/core/errors/failure.dart';

abstract class StatusUseCasesMethod<Type > {
Either<Failure, Type> call();
  
}


