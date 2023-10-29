import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();
  Future<bool> isFirstTimer();
}

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> cacheFirstTimer() {
    // TODO: implement cacheFirstTimer
    throw UnimplementedError();
  }

  @override
  Future<bool> isFirstTimer() {
    // TODO: implement isFirstTimer
    throw UnimplementedError();
  }
}
