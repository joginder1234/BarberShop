import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/profile/customer_edit_profile.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_profile/salon_edit_profile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';

class SalonAppProfile extends StatefulWidget {
  const SalonAppProfile({super.key});

  @override
  State<SalonAppProfile> createState() => _SalonAppProfileState();
}

class _SalonAppProfileState extends State<SalonAppProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(title: "Profile", elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                addHeight(20),
                SizedBox(
                  width: getWidth(context),
                  height: 187,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        AppColors.blackColor.withOpacity(0.15),
                                    blurRadius: 5)
                              ]),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: getWidth(context) - 45,
                            height: 270,
                            child: Image.network(profile_image),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -100,
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
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Green Scissors Day Salon",
                      style: TextThemeProvider.heading2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      OutlinedAppIcons.cameraIcon,
                      width: 20,
                    ),
                  ],
                ),
                addHeight(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Opening Time",
                      style: TextThemeProvider.bodyText
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Monday-Friday",
                          style: TextThemeProvider.bodyTextSmall),
                      Column(
                        children: [
                          Text("● 7:30-11:30 AM",
                              style: TextThemeProvider.bodyTextSmall),
                          Text("● 1:30-5:30 PM",
                              style: TextThemeProvider.bodyTextSmall),
                        ],
                      )
                    ]),
                addHeight(15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Saturday-Sunday",
                          style: TextThemeProvider.bodyTextSmall),
                      Text("● 7:30-11:30 AM",
                          style: TextThemeProvider.bodyTextSmall)
                    ]),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Contact",
                      style: TextThemeProvider.bodyText
                          .copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text("+345 111 222 33",
                      style: TextThemeProvider.bodyTextSmall
                          .copyWith(color: AppColors.activeButtonColor)),
                ),
                const Divider(),
                ListTile(
                  title: Text("Address",
                      style: TextThemeProvider.bodyText
                          .copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text("Marconi Street, Kern County, CA-93504",
                      style: TextThemeProvider.bodyTextSmall
                          .copyWith(color: AppColors.activeButtonColor)),
                ),
                const Divider(),
                addHeight(25),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(title: "Edit Profile", ontap: () {}),
      ),
    );
  }
}
