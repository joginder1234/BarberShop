import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/forgot_password/new_password.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        appBar: emptyAppBar(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Forgot Password",
                style: TextThemeProvider.heading1.copyWith(fontSize: 24),
              ),
              Text(
                "Don’t worry, enter the email for verification",
                style: TextThemeProvider.bodyText,
              ),
              addHeight(55),
              CustomTextFieldView(
                label: "Email",
                hint: "email.example@gmail.com",
              )
            ],
          ),
        )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(24),
          width: getWidth(context),
          child: ExpandedButtonView(
              title: "Continue",
              ontap: () => pushTo(context, const NewPasswordView())),
        ),
      ),
    );
  }
}
