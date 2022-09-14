import 'package:flutter/material.dart';

import '../services/stylesheet/colors.dart';
import '../services/stylesheet/text_theme.dart';

class CustomActionButton extends StatelessWidget {
  String label;
  Color btnColor, labelColor;
  double radius;

  CustomActionButton(
      {Key? key,
      required this.label,
      this.btnColor = AppColors.activeButtonColor,
      this.labelColor = AppColors.whiteColor,
      this.radius = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20)),
            minimumSize: MaterialStateProperty.all(const Size(70, 35)),
            maximumSize: MaterialStateProperty.all(const Size(110, 35)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
            backgroundColor: MaterialStateProperty.all(btnColor)),
        onPressed: () {},
        child: Text(label,
            style: TextThemeProvider.bodyTextSecondary
                .copyWith(color: labelColor)));
  }
}
