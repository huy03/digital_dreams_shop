import 'package:digital_dreams_shop/core/usecases/usecase.dart';
import 'package:digital_dreams_shop/core/utils/typdefs.dart';
import 'package:digital_dreams_shop/features/auth/domain/entities/user.dart';
import 'package:digital_dreams_shop/features/profile/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateCurrentUser
    extends UseCaseWithParams<User, UpdateCurrentUserParams> {
  const UpdateCurrentUser(this.repository);

  final ProfileRepository repository;

  @override
  ResultFuture<User> call(UpdateCurrentUserParams params) {
    return repository.updateProfile(
      username: params.username,
      email: params.email,
      phoneNumber: params.phoneNumber,
      gender: params.gender,
      birthday: params.birthday,
    );
  }
}

class UpdateCurrentUserParams extends Equatable {
  const UpdateCurrentUserParams({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.birthday,
  });

  final String username;
  final String email;
  final String phoneNumber;
  final String gender;
  final String birthday;

  @override
  List<Object?> get props => [username, email, phoneNumber];
}
