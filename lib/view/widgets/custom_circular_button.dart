import 'package:flutter/material.dart';
import 'package:rick_morty/utils/colors.dart';
import 'package:rick_morty/utils/styles.dart';

class CustomCircularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomCircularButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style:TextStyles.body1Strong(AppColors.baseColorWhite),
      ),
    );
  }
}