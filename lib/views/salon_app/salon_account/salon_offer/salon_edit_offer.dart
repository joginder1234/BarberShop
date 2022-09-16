import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonEditOfferAppView extends StatefulWidget {
  const SalonEditOfferAppView({super.key});

  @override
  State<SalonEditOfferAppView> createState() => _SalonEditOfferAppViewState();
}

class _SalonEditOfferAppViewState extends State<SalonEditOfferAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Edit Offer", elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Offer added/edited by you can seen by the users at the home screen.",
                    style: TextThemeProvider.bodyTextSecondary,
                    textAlign: TextAlign.center,
                  ),
                ),
                addHeight(20),
                Text(
                  "Details",
                  style: TextThemeProvider.bodyText
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                addHeight(15),
                Wrap(
                  runSpacing: 20,
                  children: [
                    CustomTextFieldView(
                      hint: "Jhon Doe",
                      label: "Title*",
                    ),
                    CustomTextFieldView(
                      hint: "Only for Boys",
                      label: "Description*",
                    ),
                    CustomTextFieldView(
                      hint: "Change",
                      label: "Banner Image*",
                      readOnly: true,
                      suffixIcon: OutlinedAppIcons.uploadIcon,
                    ),
                    CustomTextFieldView(
                      hint: "Oct 8- Oct 12",
                      label: "Dates*",
                      readOnly: true,
                      suffixIcon: OutlinedAppIcons.calendarIcon,
                    ),
                    CustomTextFieldView(
                      hint: "10% OFF",
                      label: "Offer Value*",
                      readOnly: true,
                      suffixIcon: OutlinedAppIcons.downArrow,
                    ),
                    CustomTextFieldView(
                      hint: "NILL",
                      label: "Terms",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
