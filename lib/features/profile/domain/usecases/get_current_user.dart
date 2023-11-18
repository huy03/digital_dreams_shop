import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';
import 'package:digital_dreams_shop/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUser extends UseCaseWithoutParams<User> {
  const GetCurrentUser(this.repository);

  final ProfileRepository repository;

  @override
  ResultFuture<User> call() {
    return repository.getCurrentUser();
  }
}
