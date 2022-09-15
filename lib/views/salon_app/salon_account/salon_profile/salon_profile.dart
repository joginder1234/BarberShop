import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_profile/salon_edit_profile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Profile", elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(20),
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    profile_image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.blackColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  OutlinedAppIcons.cameraIcon,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  profile_image,
                                ),
                              ),
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    OutlinedAppIcons.cameraIcon,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                addHeight(60),
                Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        child: Text(
                          "Green Scissors Day Salon",
                          style: TextThemeProvider.heading2
                              .copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                OutlinedAppIcons.editIcon,
                                color: AppColors.blackColor,
                                width: 24,
                              ))),
                    ),
                  ],
                ),
                addHeight(25),
                Text(
                  "Opening Time",
                  style: TextThemeProvider.bodyText
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                addHeight(8),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        "Monday-Friday",
                        style: TextThemeProvider.bodyTextSmall
                            .copyWith(color: AppColors.blackLightColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text("● 7:30-11:30 AM",
                              style: TextThemeProvider.bodyTextSmall),
                          Text("● 1:30-5:30 PM",
                              style: TextThemeProvider.bodyTextSmall),
                        ],
                      ),
                    ),
                  )
                ]),
                addHeight(15),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: SizedBox(
                      child: Text("Saturday-Sunday",
                          style: TextThemeProvider.bodyTextSmall
                              .copyWith(color: AppColors.blackLightColor)),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text("● 7:30-11:30 AM",
                              style: TextThemeProvider.bodyTextSmall),
                        ],
                      ),
                    ),
                  )
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
        child: ExpandedButtonView(
            title: "Edit Profile",
            ontap: () {
              pushTo(context, const SalonAppEditProfileview());
            }),
      ),
    );
  }
}
