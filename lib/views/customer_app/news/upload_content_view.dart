import 'dart:io';

import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/salon_side/image_selection.dart';
import 'package:barbershop/views/customer_app/news/salon_upload_content.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomerAppUploadNewContent extends StatefulWidget {
  const CustomerAppUploadNewContent({Key? key}) : super(key: key);

  @override
  State<CustomerAppUploadNewContent> createState() =>
      _CustomerAppUploadNewContentState();
}

enum MediaType { image, document, url }

class _CustomerAppUploadNewContentState
    extends State<CustomerAppUploadNewContent> {
  MediaType _types = MediaType.image;
  List<XFile> selectedImages = [];
  final List<String> _salonList = [
    "Select Salon",
    "Dazy Hair Dressers",
    "Lovely Hair Dressers",
    "Shenaaz Parlour"
  ];
  String selectedSalon = "Select Salon";

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
                  "Speak to saloon owner if you want to publish content on this page including listing local events, advertise community news etc!",
                  textAlign: TextAlign.center,
                  style: TextThemeProvider.bodyTextSmall,
                ),
              ),
              addHeight(20),
              Text(
                "Upload your content for request",
                style: TextThemeProvider.heading2,
              ),
              RadioListTile<MediaType>(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Image", style: TextThemeProvider.bodyText),
                  value: MediaType.image,
                  groupValue: _types,
                  onChanged: (value) {
                    setState(() => _types = value!);
                  }),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: selectedImages.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      childAspectRatio: 1),
                  itemBuilder: (context, i) {
                    if (i == selectedImages.length) {
                      return const imagePickerBox();
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(selectedImages[i].path)),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      );
                    }
                  }),
              RadioListTile<MediaType>(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Document", style: TextThemeProvider.bodyText),
                  value: MediaType.document,
                  groupValue: _types,
                  onChanged: (value) {
                    setState(() => _types = value!);
                  }),
              ExpandedButtonView(
                  title: "Upload ",
                  ontap: () {},
                  titleColor: _types != MediaType.document
                      ? AppColors.blackLightColor
                      : AppColors.whiteColor,
                  isDisabled: _types != MediaType.document),
              RadioListTile<MediaType>(
                  contentPadding: EdgeInsets.zero,
                  title: Text("URL", style: TextThemeProvider.bodyText),
                  value: MediaType.url,
                  groupValue: _types,
                  onChanged: (value) {
                    setState(() => _types = value!);
                  }),
              CustomTextFieldView(
                readOnly: _types != MediaType.url,
                hint: "paste link here...",
              ),
              addHeight(25),
              Text(
                "Select Salon",
                style: TextThemeProvider.heading2,
              ),
              addHeight(10),
              CustomDropdownButton(
                  onChanged: (v) => setState(() => selectedSalon = v),
                  value: selectedSalon,
                  items: _salonList)
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(title: "Request Owner", ontap: () {}),
      ),
    );
  }
}
