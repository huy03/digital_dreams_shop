import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNextBtn extends StatelessWidget {
  CustomNextBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
                margin: EdgeInsets.only(top: 40, left: 290),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF462626).withOpacity(0.2), 
                      spreadRadius: 0, 
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                height: 45,
                width: 45,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svgIcons/arrow_next_icon.svg'),
                  style: IconButton.styleFrom(
                      backgroundColor: Color(0xFF87220F), elevation: 2),
                ),
              );
  }
}