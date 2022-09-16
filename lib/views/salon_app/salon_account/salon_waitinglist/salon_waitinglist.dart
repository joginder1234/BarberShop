import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/widgets/home_salon_tile.dart';
import 'package:flutter/material.dart';

class SalonWaitingList extends StatelessWidget {
  const SalonWaitingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "My Waiting List"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              addHeight(40),
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
                  textButton(onTap: () {}, text: "View All"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
