import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorInkwellBtn extends StatelessWidget {
  ColorInkwellBtn({super.key, required this.colorbg});
  @override
  final Color colorbg;
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(
              color: colorbg,
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}
