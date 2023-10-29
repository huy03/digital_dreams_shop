import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  const APIException(this.message, this.statusCode);

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
