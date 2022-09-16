import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonAddNewOfferAppView extends StatefulWidget {
  const SalonAddNewOfferAppView({super.key});

  @override
  State<SalonAddNewOfferAppView> createState() =>
      _SalonAddNewOfferAppViewState();
}

class _SalonAddNewOfferAppViewState extends State<SalonAddNewOfferAppView> {
  @override
  Widget build(BuildContext context) {
    String selectedOffer = 'Select Offer';
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Add New Offer", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Offer added/edited by you can seen by the users at the home screen.",
                  style: TextThemeProvider.bodyTextSecondary,
                  textAlign: TextAlign.center,
                ),
              ),
              addHeight(20),
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
                    hint: "Enter Title",
                    label: "Title*",
                  ),
                  CustomTextFieldView(
                    hint: "Add Description",
                    label: "Description*",
                  ),
                  CustomTextFieldView(
                    hint: "Upload",
                    label: "Banner Image*",
                    readOnly: true,
                    suffixIcon: OutlinedAppIcons.uploadIcon,
                  ),
                  CustomTextFieldView(
                    hint: "Select",
                    label: "Dates*",
                    readOnly: true,
                    suffixIcon: OutlinedAppIcons.calendarIcon,
                  ),
                  CustomDropdownButton(
                      onChanged: (v) => setState(() => selectedOffer = v),
                      value: selectedOffer,
                      label: "Offer Value",
                      items: salonOffers),
                  CustomTextFieldView(
                    hint: "Select price or discount",
                    label: "Offer Value*",
                    readOnly: true,
                    suffixIcon: OutlinedAppIcons.downArrow,
                  ),
                  CustomTextFieldView(
                    hint: "Term and Conditions (If any)",
                    label: "Terms",
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
