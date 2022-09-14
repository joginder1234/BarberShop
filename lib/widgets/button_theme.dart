import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';

class ExpandedButtonView extends StatelessWidget {
  String title;
  Color btnColor;
  Color titleColor;
  bool isDisabled;
  double radius;
  Function ontap;
  ExpandedButtonView(
      {Key? key,
      required this.title,
      required this.ontap,
      this.isDisabled = false,
      this.radius = 10,
      this.btnColor = AppColors.activeButtonColor,
      this.titleColor = AppColors.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius))),
                  backgroundColor: MaterialStateProperty.all(isDisabled == true
                      ? AppColors.textFieldBorder
                      : btnColor)),
              onPressed: isDisabled ? () {} : () => ontap(),
              child: Text(title,
                  style:
                      TextThemeProvider.heading3.copyWith(color: titleColor))),
        )),
      ],
    );
  }
}
