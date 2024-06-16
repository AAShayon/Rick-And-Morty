import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:ricky_morty/utils/colors.dart';

class BlurredBackgroundStack extends StatelessWidget {
  final String? backgroundImage;
  final double blurSigmaX;
  final double blurSigmaY;
  // final Color overlayColor;
  final Widget child;

  const BlurredBackgroundStack({
    super.key,
    this.backgroundImage,
    this.blurSigmaX = 5.0,
    this.blurSigmaY = 5.0,
   // required this.overlayColor, //
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage!),
              fit: BoxFit.fill,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
          child: Container(
            color:AppColors.baseColorBlack.withOpacity(.6),
          ),
        ),
        child,
      ],
    );
  }
}
