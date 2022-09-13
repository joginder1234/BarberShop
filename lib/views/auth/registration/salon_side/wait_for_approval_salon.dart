import 'package:barbershop/onboarding.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class WaitForSalonApprovalView extends StatelessWidget {
  const WaitForSalonApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(),
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: getWidth(context) * 0.7,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Please wait for\nAdmin approval.",
                    style: TextThemeProvider.heading1.copyWith(fontSize: 30)),
                Text(
                  "You’ll be notified once approved.",
                  style: TextThemeProvider.bodyTextSmall,
                )
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        width: getWidth(context),
        child: ExpandedButtonView(
            title: "Continue",
            ontap: () => pushToandRemove(context, const OnBoardingView())),
      ),
    );
  }
}
