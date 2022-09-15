import 'package:barbershop/services/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/stylesheet/colors.dart';
import '../../../services/stylesheet/text_theme.dart';

class SalonServiceTileWidget extends StatelessWidget {
  bool isSelected;
  CategoryModel item;
  SalonServiceTileWidget(
      {super.key, required this.isSelected, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? AppColors.activeButtonColor : AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: SizedBox(
                    child: FittedBox(
                        child: SvgPicture.asset(
              item.image,
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.activeButtonColor,
            )))),
            Container(
              height: 48,
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text(item.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextThemeProvider.bodyTextSecondary.copyWith(
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.blackColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
