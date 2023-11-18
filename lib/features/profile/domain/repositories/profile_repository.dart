import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  ResultFuture<User> getCurrentUser();
}
