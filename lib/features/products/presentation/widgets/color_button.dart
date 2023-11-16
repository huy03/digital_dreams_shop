import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, required this.color, this.onTap});

  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}
