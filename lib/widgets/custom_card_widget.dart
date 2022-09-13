import 'package:flutter/material.dart';

import '../services/stylesheet/colors.dart';

class CustomCardWidget extends StatelessWidget {
  double radius;
  double? height;
  double? width;
  bool elevated;
  Color bgColor;
  Widget child;
  CustomCardWidget(
      {Key? key,
      this.radius = 10,
      this.elevated = true,
      this.bgColor = AppColors.whiteColor,
      this.height,
      this.width,
      this.child = const SizedBox()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: (height != null || width != null)
          ? const BoxConstraints().tighten(width: width, height: height)
          : BoxConstraints.tightFor(width: width, height: height),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: elevated
              ? [
                  BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.15),
                      blurRadius: 5)
                ]
              : []),
      child: child,
    );
  }
}
