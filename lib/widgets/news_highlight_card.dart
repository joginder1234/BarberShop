import 'package:barbershop/widgets/statistical_icons.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../services/helpers/help_functions.dart';
import '../services/stylesheet/icons.dart';
import '../services/stylesheet/text_theme.dart';

class NewsCardHighlight extends StatelessWidget {
  const NewsCardHighlight({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(salon_image), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12))),
              )),
              Container(
                width: getWidth(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2 hours ago",
                        style: TextThemeProvider.bodyTextSecondary
                            .copyWith(fontStyle: FontStyle.italic)),
                    Text(
                        "Ultrices malesuada eu posuere sed nibh fusce aenean leo suscipit. ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextThemeProvider.bodyText
                            .copyWith(fontWeight: FontWeight.w700)),
                    addHeight(7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TileStatisticalIcons(
                            value: "25", icon: OutlinedAppIcons.favoriteIcon),
                        addWidth(20),
                        TileStatisticalIcons(
                            value: "3", icon: OutlinedAppIcons.shareIcon)
                      ],
                    ),
                    addHeight(5)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
