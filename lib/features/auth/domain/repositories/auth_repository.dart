import 'package:digital_dreams_shop/core/utils/typdefs.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  ResultFuture<void> signInWithGoogle();
  ResultFuture<void> signInWithFacebook();
  ResultFuture<void> signUpWithEmailAndPassword(String email, String password);
  ResultFuture<void> signOut();
  ResultFuture<bool> isSignedIn();
  ResultFuture<String> getUser();
}
