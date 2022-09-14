import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';

class CustomerFAQsView extends StatelessWidget {
  const CustomerFAQsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "FAQ's", elevation: 0),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (conext, i) => ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.zero,
                        textColor: AppColors.blackColor,
                        title: Text(
                            "What If I accidentaly signed up as a barber?",
                            style: TextThemeProvider.heading3),
                        children: [
                          Text(
                              "Nibh enim adipiscing ac tristique eu consequat, augue eu nulla. Dolor, sit tortor, egestas nulla nulla diam bibendum viverra leo.",
                              style: TextThemeProvider.bodyTextSmall.copyWith(
                                  color: AppColors.blackColor.withOpacity(0.5)))
                        ],
                      ),
                  separatorBuilder: (context, i) => const Divider(),
                  itemCount: 4))),
    );
  }
}
