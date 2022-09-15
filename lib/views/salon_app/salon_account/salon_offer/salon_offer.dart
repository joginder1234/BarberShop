import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_offer/salon_add_new_offer.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_offer/salon_edit_offer.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_profile/salon_edit_profile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalonOfferAppView extends StatefulWidget {
  const SalonOfferAppView({super.key});

  @override
  State<SalonOfferAppView> createState() => _SalonOfferAppViewState();
}

class _SalonOfferAppViewState extends State<SalonOfferAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(title: "My offers", elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  ...List.generate(
                    6,
                    (index) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.blackColor.withOpacity(0.15),
                                  blurRadius: 5)
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 70),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(18),
                                              left: Radius.circular(18)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          child: Image.network(
                                            profile_image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              OutlinedAppIcons.cameraIcon),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            pushTo(context,
                                                const SalonEditOfferAppView());
                                          },
                                          icon: SvgPicture.asset(
                                            OutlinedAppIcons.editIcon,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Personality Bov Event",
                                  style: TextThemeProvider.bodyText,
                                ),
                                subtitle: Text(
                                  "Oct 8-Oct 12",
                                  style: TextThemeProvider.helperText,
                                ),
                                trailing: RichText(
                                  text: TextSpan(
                                    text: "10%",
                                    style: TextThemeProvider.bodyText.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor),
                                    children: const [
                                      TextSpan(
                                          text: "  OFF",
                                          style: TextStyle(
                                              fontSize: 6,
                                              color: AppColors.primaryColor)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addHeight(25),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
            title: "Add New Offer",
            ontap: () {
              pushTo(context, const SalonAddNewOfferAppView());
            }),
      ),
    );
  }
}
