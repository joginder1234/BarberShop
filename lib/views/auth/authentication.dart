import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/helpers/toast.dart';
import 'package:barbershop/services/models/user_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/forgot_password/forgot_password.dart';
import 'package:barbershop/views/auth/phone_auth/otp_view.dart';
import 'package:barbershop/views/auth/registration/choose_role.dart';
import 'package:barbershop/views/customer_app/bottom_nav_bar.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String inputLabel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Let’s sign you in.",
                style: TextThemeProvider.heading1.copyWith(fontSize: 30)),
            addHeight(15),
            Text("Wellcome back!",
                style: TextThemeProvider.bodyText.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: AppColors.blackColor.withOpacity(0.6))),
            addHeight(25),
            CustomTextFieldView(
              onchange: (v) => onInputChange(v),
              label: inputLabel,
              controller: _inputController,
              hint: "Enter your email or mobile no.",
            ),
            addHeight(26),
            inputLabel == 'Email'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFieldView(
                        label: "Password",
                        controller: _passController,
                        hint: "********",
                      ),
                      addHeight(15),
                      TextButton(
                          onPressed: () =>
                              pushTo(context, const ForgotPasswordView()),
                          child: Text("Forgot your password?",
                              style: TextThemeProvider.heading3))
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextThemeProvider.bodyTextSmall,
                ),
                Container(
                  width: 2,
                  height: 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackColor.withOpacity(0.2)),
                ),
                TextButton(
                    onPressed: () => pushTo(context, const ChooseProfileRole()),
                    child: Text(
                      "Register",
                      style: TextThemeProvider.heading3,
                    ))
              ],
            ),
            addHeight(20),
            ExpandedButtonView(
                title: inputLabel == 'Email' ? "Sign In" : "Next",
                ontap: () => validateInput())
          ],
        ),
      ),
    );
  }

  validateInput() {
    if (_inputController.text.isEmpty) {
      showToast("Please enter your email or Phone number");
    } else {
      if (inputLabel == 'Email' && _passController.text.isEmpty) {
        showToast("Wrong Input");
      } else {
        login();
      }
    }
  }

  login() {
    final database = testUsers;
    List<UserModel> user;
    if (_inputController.text.contains("@")) {
      user = database
          .where((element) =>
              element.email.toLowerCase() ==
              _inputController.text.toLowerCase())
          .toList();
      if (user.isEmpty) {
        showToast("Account not found. Please register");
      } else {
        if (user[0].password == _passController.text) {
          getRoute(user[0].role);
        } else {
          showToast("Wront Password");
        }
      }
    } else {
      user = database
          .where((element) => element.phone == _inputController.text)
          .toList();
      if (user.isEmpty) {
        showToast("Account not found. Please register");
      } else {
        pushTo(context, PhoneOtpView(role: user[0].role));
      }
    }
  }

  getRoute(String role) {
    switch (role) {
      case "customer":
        return pushTo(context, const BottomNavScreen());
      case "salon":
        return showToast("Comming Soon");
      case "barber":
        return showToast("Comming Soon");
      default:
        return null;
    }
  }

  onInputChange(String value) {
    if (value.contains("@") &&
        (value.contains(".com") || value.contains(".in"))) {
      setState(() => inputLabel = "Email");
    } else if (value.length == 10 && !value.contains("@")) {
      setState(() => inputLabel = "Phone");
    } else {
      setState(() => inputLabel = "");
      null;
    }
  }
}
