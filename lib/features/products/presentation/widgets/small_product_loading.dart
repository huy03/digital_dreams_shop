import 'package:digital_dreams_shop/core/common/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

class SmallProductLoading extends StatelessWidget {
  const SmallProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ShimmerWidget(
          height: 170,
          width: 170,
          radius: 20,
        ),
        SizedBox(
          height: 12,
        ),
        ShimmerWidget(
          height: 16,
          width: 100,
          radius: 20,
        ),
        SizedBox(
          height: 8,
        ),
        ShimmerWidget(
          height: 15,
          width: 60,
          radius: 20,
        ),
        SizedBox(
          height: 8,
        ),
        ShimmerWidget(
          height: 15,
          width: 80,
          radius: 20,
        ),
      ],
    );
  }
}
