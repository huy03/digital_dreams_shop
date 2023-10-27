import 'package:digital_dreams_shop/config/theme/media_resource.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/custom_image.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/subtitle_text.dart';
import 'package:digital_dreams_shop/features/on_boarding/presentation/widgets/title_text.dart';
import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(image: MediaResource.onBoardThree),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TitleText(
                    text: "20% Discount\nNew Arrival Product",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Subtitle(
                    text:
                        'Publish up your selfies to make yourself\nmore beautiful with this app',
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
