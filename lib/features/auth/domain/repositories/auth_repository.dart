import 'package:digital_dreams_shop/core/utils/typdefs.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  ResultFuture<void> logInWithGoogle();

  ResultFuture<void> logInWithFacebook();

  ResultFuture<void> signUp({
    required String email,
    required String password,
    required int phoneNumber,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> updateUser();

  ResultFuture<void> signOut();

  ResultFuture<String> getUser();
}
