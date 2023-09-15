import 'package:ecommerce_app/core/utils/typdefs.dart';

abstract class OnBoardingRepos {
  const OnBoardingRepos();

  ResultFuture<void> cacheFirstTimer();

  ResultFuture<bool> checkIfUserIsFirstTimer();
}
