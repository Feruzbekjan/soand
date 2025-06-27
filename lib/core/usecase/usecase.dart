

import 'package:soand/core/either/either.dart';
import 'package:soand/core/error/failure_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams {}
