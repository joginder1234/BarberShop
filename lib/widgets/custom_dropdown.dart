import 'package:flutter/material.dart';

import '../services/stylesheet/colors.dart';
import '../services/stylesheet/text_theme.dart';

class CustomDropdownButton extends StatelessWidget {
  Function(String)? onChanged;
  String value, label;
  List<String> items;

  CustomDropdownButton(
      {Key? key,
      required this.onChanged,
      required this.value,
      this.label = '',
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.textFieldBorder)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: label == ""
                ? null
                : Text(" $label ",
                    style: TextThemeProvider.bodyTextSecondary
                        .copyWith(backgroundColor: AppColors.whiteColor)),
            floatingLabelAlignment: FloatingLabelAlignment.start,
          ),
          borderRadius: BorderRadius.circular(10),
          value: value,
          items: items
              .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => onChanged!(v.toString())),
    );
  }
}
