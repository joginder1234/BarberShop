import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';

class ExpandedButtonView extends StatefulWidget {
  String title;
  Color btnColor;
  Color titleColor;
  bool isDisabled;
  Function ontap;
  ExpandedButtonView(
      {Key? key,
      required this.title,
      required this.ontap,
      this.isDisabled = false,
      this.btnColor = AppColors.activeButtonColor,
      this.titleColor = AppColors.whiteColor})
      : super(key: key);

  @override
  State<ExpandedButtonView> createState() => _ExpandedButtonViewState();
}

class _ExpandedButtonViewState extends State<ExpandedButtonView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          child: FlatButton(
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: widget.isDisabled == true
                  ? AppColors.textFieldBorder
                  : widget.btnColor,
              onPressed: widget.isDisabled ? () {} : () => widget.ontap(),
              child: Text(widget.title,
                  style: TextThemeProvider.heading3
                      .copyWith(color: widget.titleColor))),
        )),
      ],
    );
  }
}
