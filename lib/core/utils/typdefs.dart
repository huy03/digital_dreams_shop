import 'package:dartz/dartz.dart';
import 'package:digital_dreams_shop/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;
