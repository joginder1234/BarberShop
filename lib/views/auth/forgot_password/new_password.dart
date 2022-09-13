import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        appBar: emptyAppBar(),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email verified!", style: TextThemeProvider.heading1),
                Text("Enter the new password",
                    style: TextThemeProvider.bodyText),
                addHeight(30),
                CustomPasswordField(
                  label: "New Password",
                  hint: "********",
                ),
                addHeight(20),
                CustomPasswordField(
                  label: "Confirm Password",
                  hint: "********",
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: getWidth(context),
          padding: const EdgeInsets.all(24),
          child: ExpandedButtonView(title: "Save & continue", ontap: () {}),
        ),
      ),
    );
  }
}
