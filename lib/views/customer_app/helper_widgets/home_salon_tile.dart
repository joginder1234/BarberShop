import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class HomeSalonTile extends StatefulWidget {
  const HomeSalonTile({super.key});

  @override
  State<HomeSalonTile> createState() => _HomeSalonTileState();
}

class _HomeSalonTileState extends State<HomeSalonTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Jhone Doe",
                  style: TextThemeProvider.bodyTextSmall.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.blackColor),
                  children: [
                    TextSpan(
                      text: "   4.6",
                      style: TextThemeProvider.bodyTextSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              )
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("2:00PM, Barber Name",
                  style: TextThemeProvider.helperText
                      .copyWith(color: AppColors.blackColor.withOpacity(0.4))),
              addHeight(8),
              Text(
                "Confirmed",
                style: TextThemeProvider.bodyTextSmall.copyWith(
                    color: AppColors.statusGoodColor,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          trailing: Column(
            children: [
              TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.activeButtonColor)),
                  onPressed: () {},
                  child: Text("Skip",
                      style: TextThemeProvider.bodyTextSecondary
                          .copyWith(color: AppColors.whiteColor))),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
