import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });

  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.grey[400]!,
          ),
        ),
      ),
    );
  }
}
