import 'package:digital_dreams_shop/core/utils/typdefs.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  ResultFuture<void> logInWithGoogle();
  ResultFuture<void> logInWithFacebook();
  ResultFuture<void> signUpWithEmailAndPassword(String email, String password);
  ResultFuture<void> signOut();
  ResultFuture<bool> isSignedIn();
  ResultFuture<String> getUser();
}
