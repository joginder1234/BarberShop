import 'package:flutter/material.dart';
import '../../../services/helpers/help_functions.dart';
import '../../../services/stylesheet/colors.dart';
import '../../../services/stylesheet/text_theme.dart';

class RoleChooseTileCard extends StatelessWidget {
  String icon;
  String title;
  bool isActive;
  RoleChooseTileCard(
      {Key? key, this.icon = '', this.title = '', this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(((getWidth(context) * 0.5) - 30) * 0.2),
      width: (getWidth(context) * 0.5) - 30,
      height: (getWidth(context) * 0.5) - 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive
              ? AppColors.activeButtonColor
              : AppColors.textFieldBorder),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              icon,
              color: isActive ? AppColors.whiteColor : AppColors.blackColor,
              height: ((getWidth(context) * 0.5) - 30) * 0.4,
            ),
            addHeight(10),
            Text(title,
                style: TextThemeProvider.heading3.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        isActive ? AppColors.whiteColor : AppColors.blackColor))
          ],
        ),
      ),
    );
  }
}
