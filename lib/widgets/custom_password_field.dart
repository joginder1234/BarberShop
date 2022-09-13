import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/stylesheet/colors.dart';
import '../services/stylesheet/text_theme.dart';

class CustomPasswordField extends StatefulWidget {
  TextEditingController? controller;
  String hint;
  String label;

  Function(String)? onchange;
  CustomPasswordField({
    Key? key,
    this.controller,
    this.hint = '',
    this.label = '',
    this.onchange,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.textFieldBorder)),
      child: TextField(
        obscureText: obsecure,
        obscuringCharacter: "*",
        onChanged: widget.onchange,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () => setState(() => obsecure = !obsecure),
              icon: SvgPicture.asset(OutlinedAppIcons.showIcon)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(" ${widget.label} ",
              style: TextThemeProvider.bodyTextSecondary
                  .copyWith(backgroundColor: AppColors.whiteColor)),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
