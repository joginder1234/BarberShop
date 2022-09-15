import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonAppUploadNewContent extends StatefulWidget {
  const SalonAppUploadNewContent({Key? key}) : super(key: key);

  @override
  State<SalonAppUploadNewContent> createState() =>
      _SalonAppUploadNewContentState();
}

class _SalonAppUploadNewContentState extends State<SalonAppUploadNewContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Upload your content", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Upload content including listing local events, advertise community news etc!",
                  textAlign: TextAlign.center,
                  style: TextThemeProvider.bodyTextSmall,
                ),
              ),
              addHeight(20),
              Wrap(
                runSpacing: 20,
                children: [
                  Text(
                    "Details",
                    style: TextThemeProvider.heading2,
                  ),
                  CustomTextFieldView(
                    hint: "Enter Title*",
                    label: "Title*",
                  ),
                  CustomTextFieldView(
                    maxlines: 3,
                    hint: "Add Description Upto 2 Sentences",
                    label: "Description*",
                  ),
                  CustomTextFieldView(
                    hint: "Upload",
                    label: "Thumbnail*",
                    ontap: () {},
                    suffixIcon: OutlinedAppIcons.uploadIcon,
                  ),
                  CustomTextFieldView(
                    hint: "Upload",
                    label: "Images",
                    suffixIcon: OutlinedAppIcons.uploadIcon,
                    ontap: () {},
                  ),
                  CustomTextFieldView(
                    hint: "e.g. Local Event, News...",
                    label: "Tags",
                  ),
                  CustomTextFieldView(
                    maxlines: 9,
                    hint: "Start typing or paste text",
                    label: "Content",
                  ),
                ],
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child:
            ExpandedButtonView(title: "Post to Community News", ontap: () {}),
      ),
    );
  }
}
