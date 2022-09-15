import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonAppEditProfileview extends StatefulWidget {
  const SalonAppEditProfileview({Key? key}) : super(key: key);

  @override
  State<SalonAppEditProfileview> createState() =>
      _SalonAppEditProfileviewState();
}

class _SalonAppEditProfileviewState extends State<SalonAppEditProfileview> {
  String selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: "Profile", elevation: 0),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customExpansionTile(
                    title: "Owner Information",
                    content: [
                      addHeight(5),
                      CustomTextFieldView(
                        hint: "Jhon Doe",
                        label: "Name",
                      ),
                      addHeight(15),
                      CustomTextFieldView(
                        hint: "XXXXXXX123",
                        label: "Mobile",
                      ),
                      addHeight(15),
                      CustomTextFieldView(
                        hint: "example@email.com",
                        label: "Email",
                      ),
                    ],
                  ),
                  addHeight(25),
                  customExpansionTile(
                    title: "Saloon Image",
                    content: [
                      addHeight(5),
                      CustomTextFieldView(
                        hint: "Change",
                        label: "Banner Image",
                        readOnly: true,
                        suffixIcon: OutlinedAppIcons.uploadIcon,
                      ),
                      addHeight(15),
                      CustomTextFieldView(
                        hint: "Change",
                        label: "Profile Image",
                        readOnly: true,
                        suffixIcon: OutlinedAppIcons.uploadIcon,
                      ),
                    ],
                  ),
                  addHeight(25),
                  customExpansionTile(
                    title: "Salon About Information",
                    content: [
                      addHeight(5),
                      CustomTextFieldView(
                        hint: "About",
                        label: "About",
                      ),
                    ],
                  ),
                  addHeight(25),
                  customExpansionTile(
                    title: "Salon Contact",
                    content: [
                      addHeight(5),
                      CustomTextFieldView(
                        hint: "XXXXXXX123",
                        label: "Mobile",
                      ),
                      addHeight(15),
                      CustomTextFieldView(
                        hint: "example@email.com",
                        label: "Email",
                      ),
                    ],
                  ),
                  addHeight(25),
                  customExpansionTile(title: "Salon Address", content: [
                    addHeight(5),
                    CustomTextFieldView(
                      hint: "Area/locality",
                      label: "Area/Locality",
                    ),
                    addHeight(15),
                    CustomTextFieldView(
                      hint: "Kern County",
                      label: "City",
                    ),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: CustomTextFieldView(
                              hint: "12345",
                              label: "ZIP",
                            ),
                          ),
                        ),
                        addWidth(12),
                        Expanded(
                          child: SizedBox(
                            child: CustomTextFieldView(
                              hint: "CA",
                              label: "State",
                            ),
                          ),
                        ),
                      ],
                    ),
                    addHeight(15),
                    CustomTextFieldView(
                      hint: "Country",
                      label: "USA",
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ExpandedButtonView(title: "Save Profile", ontap: () {}),
        ),
      ),
    );
  }
}

customExpansionTile({required title, required content}) {
  return ExpansionTile(
    tilePadding: EdgeInsets.zero,
    childrenPadding: EdgeInsets.zero,
    textColor: AppColors.blackColor,
    title: Text(
      title,
      style: TextThemeProvider.bodyTextSmall,
    ),
    children: content,
  );
}
