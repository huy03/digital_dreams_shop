import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  ResultFuture<User> getCurrentUser();
  ResultFuture<User> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  });
}
