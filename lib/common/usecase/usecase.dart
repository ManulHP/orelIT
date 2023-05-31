import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}