import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_listing_app/src/core/errors/failure.dart';

// ignore: avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
