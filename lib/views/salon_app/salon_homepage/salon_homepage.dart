import 'dart:math';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/home/customer_home.dart';
import 'package:barbershop/views/salon_app/salon_notification_view/salon_notification.dart';
import 'package:barbershop/widgets/home_salon_tile.dart';
import 'package:barbershop/views/salon_app/salon_homepage/salon_walk_in_customer.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalonHomePage extends StatefulWidget {
  const SalonHomePage({super.key});

  @override
  State<SalonHomePage> createState() => _SalonHomePageState();
}

class _SalonHomePageState extends State<SalonHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Green Scissors Day Salon",
                    style: TextThemeProvider.heading3
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          pushTo(context, const SalonWalkInCustomer());
                        },
                        icon: SvgPicture.asset(
                          OutlinedAppIcons.addUser,
                          height: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          pushTo(context, const SalonNotification());
                        },
                        icon: SvgPicture.asset(
                          OutlinedAppIcons.notificationIcon,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    homeSalonWork(
                        context: context,
                        title: "Completed",
                        subtitle: "55",
                        icon: OutlinedAppIcons.shieldDone,
                        onTap: () {}),
                    homeSalonWork(
                        context: context,
                        title: "Pending",
                        subtitle: "55",
                        icon: OutlinedAppIcons.timeCircle,
                        onTap: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    homeSalonWork(
                        context: context,
                        title: "Cancelled",
                        subtitle: "07",
                        icon: OutlinedAppIcons.shieldFail,
                        onTap: () {}),
                    homeSalonWork(
                        context: context,
                        title: "Moved",
                        subtitle: "21",
                        icon: OutlinedAppIcons.danger,
                        onTap: () {}),
                  ],
                ),
                addHeight(20),
                AddPageSection(
                  title: "Waiting List (Today)",
                  btnTitle: "view history",
                  ontap: () {},
                ),
                Row(
                  children: const [
                    Text(
                      "Click on the name to rate the client",
                    ),
                  ],
                ),
                addHeight(20),
                Column(
                  children: [
                    ...List.generate(
                        5,
                        (i) => HomeSalonTile(
                            distance: "2Km",
                            title: "Jhone Doe",
                            subtitle: "2:00PM, Barber Name",
                            status: "Confirmed",
                            rating: "4.6",
                            button: "Skip",
                            onTap: () {})),
                    textButton(onTap: () {}, text: "view"),
                    ExpandedButtonView(title: "Call Next", ontap: () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Barbers",
                            style: TextThemeProvider.bodyText
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text("31 in queue for 8 Barbers",
                              style: TextThemeProvider.bodyTextSmall)
                        ],
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, i) => Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Text("Ch ${i + 1}",
                                      style: TextThemeProvider.bodyTextSmall),
                                )),
                            Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: Text("Esther Howard",
                                      style: TextThemeProvider.bodyTextSmall),
                                )),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Text("${Random().nextInt(5)} in queue",
                                    style: TextThemeProvider.bodyTextSmall),
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
