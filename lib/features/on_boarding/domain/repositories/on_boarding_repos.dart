import 'package:digital_dreams_shop/core/utils/typdefs.dart';

abstract class OnBoardingRepository {
  const OnBoardingRepository();

  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> isFirstTimer();
}
