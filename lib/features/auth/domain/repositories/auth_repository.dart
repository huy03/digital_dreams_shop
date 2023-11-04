import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // ResultFuture<void> logInWithGoogle();

  // ResultFuture<void> logInWithFacebook();

  ResultFuture<void> signUp({
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
  });

  // ResultFuture<void> forgotPassword(String email);

  // ResultFuture<void> updateUser({
  //   required UserInfo userInfo,
  //   dynamic userData,
  // });

  // ResultFuture<void> signOut();

  // ResultFuture<String> getUser();
}
