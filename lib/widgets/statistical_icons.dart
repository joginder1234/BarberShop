import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../services/helpers/help_functions.dart';
import '../services/stylesheet/colors.dart';
import '../services/stylesheet/text_theme.dart';

class TileStatisticalIcons extends StatelessWidget {
  String value;
  String icon;
  TileStatisticalIcons({Key? key, required this.value, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: TextThemeProvider.bodyTextSmall),
        addWidth(5),
        SvgPicture.asset(
          icon,
          color: AppColors.blackColor.withOpacity(0.4),
          width: 18.5,
        )
      ],
    );
  }
}
