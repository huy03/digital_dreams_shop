import 'package:ecommerce_app/core/utils/typdefs.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/pages/on_boarding_screen.dart';

class OnBoardingReposImpl implements OnBoardingRepos {
  const OnBoardingReposImpl();

  @override
  ResultFuture<void> cacheFirstTimer() {}

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() {}
}
