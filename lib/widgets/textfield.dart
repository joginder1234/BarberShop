import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFieldView extends StatelessWidget {
  TextEditingController? controller;
  String hint;
  String label;
  bool isSecure;
  String suffixIcon;
  bool numPad;
  int maxlines;
  bool readOnly;
  bool isObsecure;
  Function? ontap;
  Function(String)? onchange;
  CustomTextFieldView(
      {Key? key,
      this.controller,
      this.hint = '',
      this.label = '',
      this.isSecure = false,
      this.suffixIcon = '',
      this.isObsecure = true,
      this.numPad = false,
      this.readOnly = false,
      this.maxlines = 1,
      this.ontap,
      this.onchange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.blackColor.withOpacity(0.3))),
      child: TextField(
        maxLines: maxlines,
        readOnly: readOnly,
        keyboardType: numPad ? TextInputType.phone : TextInputType.text,
        onTap: ontap != null ? () => ontap!() : null,
        onChanged: onchange,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon:
              IconButton(onPressed: null, icon: SvgPicture.asset(suffixIcon)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(" $label ",
              style: TextThemeProvider.bodyTextSecondary
                  .copyWith(backgroundColor: AppColors.whiteColor)),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
