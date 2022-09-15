import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/profile/customer_edit_profile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Profile", elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            addHeight(20),
            SizedBox(
              width: getWidth(context),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      child: SizedBox(
                        width: getWidth(context) - 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 95,
                              width: 95,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.blackColor
                                            .withOpacity(0.15),
                                        blurRadius: 5)
                                  ]),
                            )
                          ],
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.15),
                              blurRadius: 5)
                        ]),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: getWidth(context) - 45,
                      child: Column(
                        children: [
                          addHeight(45),
                          Center(
                            child: Text("Jhon Doe",
                                style: TextThemeProvider.heading3
                                    .copyWith(fontWeight: FontWeight.w700)),
                          ),
                          addHeight(15),
                          detail_tile("Mobile", "999XXXX999"),
                          addHeight(15),
                          detail_tile("Email", "Example@email.com"),
                          addHeight(15),
                          detail_tile("Address", "Kern County, CA"),
                          addHeight(15),
                          detail_tile("Gender", "Male"),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      child: SizedBox(
                        width: getWidth(context) - 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: AppColors.whiteColor,
                              backgroundImage: NetworkImage(profile_image),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            addHeight(25),
            ExpandedButtonView(
                title: "Edit Profile",
                ontap: () =>
                    pushTo(context, const CustomerAppEditProfileview())),
            // addHeight(25),
            // Row(
            //   children: const [
            //     Expanded(
            //         child: SizedBox(
            //       child: SalonTile(),
            //     )),
            //     Expanded(
            //         child: SizedBox(
            //       child: SalonTile(),
            //     ))
            //   ],
            // )
          ],
        ),
      )),
    );
  }

  Row detail_tile(String title, String value) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
          child: Text(title, style: TextThemeProvider.bodyText),
        )),
        Expanded(
            child: SizedBox(
          child: Text(value, style: TextThemeProvider.bodyText),
        )),
      ],
    );
  }
}
