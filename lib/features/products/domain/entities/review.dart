import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String product;
  final String user;
  final String comment;
  final double rating;

  const Review({
    required this.id,
    required this.product,
    required this.user,
    required this.comment,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        id,
        product,
        user,
        comment,
        rating,
      ];
}
