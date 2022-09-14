import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CustomerAppEditProfileview extends StatefulWidget {
  const CustomerAppEditProfileview({Key? key}) : super(key: key);

  @override
  State<CustomerAppEditProfileview> createState() =>
      _CustomerAppEditProfileviewState();
}

class _CustomerAppEditProfileviewState
    extends State<CustomerAppEditProfileview> {
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
                Text("Personal", style: TextThemeProvider.heading3),
                addHeight(20),
                CustomTextFieldView(
                  hint: "Jhon Doe",
                  label: "Name",
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "XXXXXXX123",
                  label: "Mobile",
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "example@email.com",
                  label: "Email",
                ),
                addHeight(20),
                CustomDropdownButton(
                    onChanged: (v) => setState(() => selectedGender = v),
                    value: selectedGender,
                    label: "Gender",
                    items: genders),
                addHeight(30),
                Text("Address", style: TextThemeProvider.heading3),
                addHeight(20),
                CustomTextFieldView(
                  hint: "Area/locality",
                  label: "Area/Locality",
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "Kern County",
                  label: "City",
                ),
                addHeight(20),
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
                addHeight(20),
                CustomTextFieldView(
                  hint: "Country",
                  label: "USA",
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ExpandedButtonView(title: "Confirm & Save", ontap: () {}),
        ),
      ),
    );
  }
}
