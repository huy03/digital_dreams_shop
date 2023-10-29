import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/on_boarding/domain/repositories/on_boarding_repos.dart';

class CacheFirstTimer extends UseCaseWithoutParams<void> {
  const CacheFirstTimer(this._repository);

  final OnBoardingRepository _repository;

  @override
  ResultFuture call() async => _repository.cacheFirstTimer();
}
