// import 'package:digital_dreams_shop/core/constraints/constraints.dart';
// import 'package:digital_dreams_shop/core/usecases/usecase.dart';
// import 'package:digital_dreams_shop/core/utils/typdefs.dart';
// import 'package:digital_dreams_shop/features/auth/domain/repositories/auth_repository.dart';
// import 'package:equatable/equatable.dart';

// class UpdateUser extends UseCaseWithParams<void, UpdateUserParams> {
//   UpdateUser(this._repository);

//   final AuthRepository _repository;

//   @override
//   ResultFuture<void> call(UpdateUserParams params) async =>
//       _repository.updateUser(
//         userInfo: params.userInfo,
//         userData: params.userData,
//       );
// }

// class UpdateUserParams extends Equatable {
//   const UpdateUserParams({
//     required this.userInfo,
//     required this.userData,
//   });

//   const UpdateUserParams.empty()
//       : this(
//           userInfo: UserInfo.userName,
//           userData: '',
//         );

//   final UserInfo userInfo;
//   final dynamic userData;

//   @override
//   List<Object?> get props => [
//         userInfo,
//         userData,
//       ];
// }
