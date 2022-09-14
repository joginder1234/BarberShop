import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CustomerHelpAndSupportView extends StatefulWidget {
  const CustomerHelpAndSupportView({Key? key}) : super(key: key);

  @override
  State<CustomerHelpAndSupportView> createState() =>
      _CustomerHelpAndSupportViewState();
}

class _CustomerHelpAndSupportViewState
    extends State<CustomerHelpAndSupportView> {
  String selectedValue = "Hair Cut";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: "Help & Support", elevation: 0),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Fill the form to post your complaint",
                    style: TextThemeProvider.bodyTextSmall,
                  ),
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "Jhon Doe",
                  label: "Name*",
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "XXXXXXX123",
                  label: "Mobile*",
                ),
                addHeight(20),
                CustomTextFieldView(
                  hint: "example@email.com",
                  label: "Email",
                ),
                addHeight(20),
                CustomDropdownButton(
                    onChanged: (v) => setState(() => selectedValue = v),
                    value: selectedValue,
                    label: "Category",
                    items:
                        categoryList.map((e) => e.title.toString()).toList()),
                addHeight(20),
                CustomTextFieldView(
                  maxlines: 5,
                  hint: "Tell us more about your query...",
                  label: "Query*",
                ),
                addHeight(20),
                Center(
                    child: Text("OR\nYou can direct call/ email to us",
                        textAlign: TextAlign.center,
                        style: TextThemeProvider.bodyText)),
                ListTile(
                  title: Text("Contact",
                      style: TextThemeProvider.bodyText
                          .copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text("+345 111 222 33",
                      style: TextThemeProvider.bodyText
                          .copyWith(color: AppColors.activeButtonColor)),
                ),
                const Divider(),
                ListTile(
                  title: Text("Address",
                      style: TextThemeProvider.bodyText
                          .copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text("Marconi Street, Kern County, CA-93504",
                      style: TextThemeProvider.bodyText
                          .copyWith(color: AppColors.activeButtonColor)),
                ),
                const Divider(),
              ],
            ),
          ),
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ExpandedButtonView(title: "Submit", ontap: () {}),
        ),
      ),
    );
  }
}
