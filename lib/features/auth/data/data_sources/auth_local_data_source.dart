import 'package:digital_dreams_shop/core/constraints/constraints.dart';
import 'package:digital_dreams_shop/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> cacheUser(UserModel user) async {
    await _preferences.setString(kAuthToken, user.token ?? '');
  }
}
