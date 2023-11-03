// import 'package:digital_dreams_shop/core/usecases/usecase.dart';
// import 'package:digital_dreams_shop/core/utils/typdefs.dart';
// import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
// import 'package:equatable/equatable.dart';

// class SignUp extends UseCaseWithParams<void, SignUpParams> {
//   final AuthRepository _repository;

//   SignUp(this._repository);

//   @override
//   ResultFuture call(SignUpParams params) => _repository.signUp(
//         email: params.email,
//         password: params.password,
//         phoneNumber: params.phoneNumber,
//       );
// }

// class SignUpParams extends Equatable {
//   const SignUpParams({
//     required this.email,
//     required this.password,
//     required this.phoneNumber,
//   });

//   final String email;
//   final String password;
//   final int phoneNumber;

//   @override
//   List<Object?> get props => [email, password, phoneNumber];
// }
