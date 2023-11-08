class Coupon {
  final String id;
  final String imageCover;
  final int discountValue;
  final String subtitle;
  final String code;

  Coupon({
    required this.id,
    required this.code,
    required this.subtitle,
    required this.discountValue,
    required this.imageCover,
  });
}
