import 'package:flutter/material.dart';

import '../config.dart';
import '../services/helpers/help_functions.dart';
import '../services/stylesheet/colors.dart';
import '../services/stylesheet/text_theme.dart';

class NewsTileHorizontal extends StatelessWidget {
  String description, timeStamp, thumbnail;
  NewsTileHorizontal(
      {Key? key,
      required this.description,
      required this.timeStamp,
      required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(
                    image: NetworkImage(salon_image), fit: BoxFit.cover)),
          ),
          addWidth(10),
          Expanded(
              child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Curabitur turpis leo malesuada facilisis interdum. Est eget leo ullamcorper etiam.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextThemeProvider.bodyText,
                ),
                addHeight(8),
                Text(
                  "3 Days ago",
                  style: TextThemeProvider.bodyTextSmall.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.blackLightColor),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
