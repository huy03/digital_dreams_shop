import 'package:digital_dreams_shop/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();
  Future<bool> isFirstTimer();
}

const kFirstTimer = 'first_timer';

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _preferences.setBool(kFirstTimer, true);
    } catch (e) {
      throw CacheException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }

  @override
  Future<bool> isFirstTimer() async {
    try {
      return _preferences.getBool(kFirstTimer) ?? true;
    } catch (e) {
      throw CacheException(
        message: e.toString(),
        statusCode: 500,
      );
    }
  }
}
