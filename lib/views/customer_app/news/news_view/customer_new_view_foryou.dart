import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/widgets/horizontal_news_tile.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/news_highlight_card.dart';

class CustomerNewsViewForYou extends StatelessWidget {
  const CustomerNewsViewForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String description =
        "Curabitur turpis leo malesuada facilisis interdum. Est eget leo ullamcorper etiam.";
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const NewsCardHighlight(),
            addHeight(30),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => NewsTileHorizontal(
                    description: description,
                    timeStamp: "3 Days ago",
                    thumbnail: salon_image))
          ],
        ),
      )),
    );
  }
}
