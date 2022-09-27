import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/image_provider.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/authentication.dart';
import 'package:barbershop/views/auth/registration/choose_role.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Stack(
                    children: [
                      Image.asset(AppImageProvider.graphic1),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        isSmallScreen(context) ? 60 : 100,
                                    maxWidth:
                                        isSmallScreen(context) ? 85 : 120),
                                child: Image.asset(appLogo)),
                            Text(appName.split(" ").join("\n"),
                                textAlign: TextAlign.center,
                                style: TextThemeProvider.heading1
                                    .copyWith(fontSize: 28))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(isSmallScreen(context) ? 15 : 25),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.05),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(44))),
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isSmallScreen(context)
                                  ? HeadText(
                                      title:
                                          "Join the Salon Queue from Anywhere.",
                                    )
                                  : FittedBox(
                                      child: HeadText(
                                        title:
                                            "Join the Salon Queue\nfrom Anywhere.",
                                      ),
                                    ),
                              addHeight(isSmallScreen(context) ? 7 : 15),
                              Text(
                                  "Consequat aliquam interdum amet nec eget gravida faucibus elit enim.",
                                  textAlign: TextAlign.center,
                                  style: TextThemeProvider.bodyText),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ExpandedButtonView(
                                title: "Register",
                                ontap: () =>
                                    pushTo(context, const ChooseProfileRole())),
                          ),
                        ),
                        addWidth(8),
                        Expanded(
                          child: SizedBox(
                            child: ExpandedButtonView(
                                title: "Sign In",
                                titleColor: AppColors.activeButtonColor,
                                btnColor: AppColors.activeButtonColor
                                    .withOpacity(0.1),
                                ontap: () => pushTo(
                                    context, const AuthenticationView())),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class HeadText extends StatelessWidget {
  String title;
  HeadText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextThemeProvider.heading1.copyWith(fontSize: 32));
  }
}
