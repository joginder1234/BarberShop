import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/choose_role.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class UserNotFoundView extends StatelessWidget {
  const UserNotFoundView({Key? key}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User not found!", style: TextThemeProvider.heading1),
            Text(
                "We could not found any account linked with the email or mobile no. You can register yourself if not registered by clicking on the link below. ",
                style: TextThemeProvider.bodyText),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        width: getWidth(context),
        padding: const EdgeInsets.all(24),
        child: ExpandedButtonView(
            title: "Register Now",
            ontap: () => pushTo(context, const ChooseProfileRole())),
      ),
    );
  }
}
