import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomerAppSalonAboutView extends StatefulWidget {
  const CustomerAppSalonAboutView({super.key});

  @override
  State<CustomerAppSalonAboutView> createState() =>
      _CustomerAppSalonAboutViewState();
}

class _CustomerAppSalonAboutViewState extends State<CustomerAppSalonAboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Information", style: TextThemeProvider.heading3),
            addHeight(8),
            ReadMoreText(
              style: TextThemeProvider.bodyTextSmall,
              salonDescription,
              trimLines: 6,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextThemeProvider.bodyTextSmall
                  .copyWith(color: AppColors.activeButtonColor),
              lessStyle: TextThemeProvider.bodyTextSmall
                  .copyWith(color: AppColors.activeButtonColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Text("Opening time", style: TextThemeProvider.heading3),
            addHeight(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SizedBox(
                  child: Text(
                    "Monday-Friday",
                    style: TextThemeProvider.bodyTextSmall
                        .copyWith(color: AppColors.blackLightColor),
                  ),
                )),
                Expanded(
                    child: SizedBox(
                  child: Column(
                    children: [
                      Text("•  7:30-11:30 AM",
                          style: TextThemeProvider.bodyTextSmall),
                      Text("•  1:30-5:30 PM",
                          style: TextThemeProvider.bodyTextSmall),
                    ],
                  ),
                )),
              ],
            ),
            addHeight(15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SizedBox(
                  child: Text(
                    "Satuarday-Sunday",
                    style: TextThemeProvider.bodyTextSmall
                        .copyWith(color: AppColors.blackLightColor),
                  ),
                )),
                Expanded(
                    child: SizedBox(
                  child: Column(
                    children: [
                      Text("•  7:30-11:30 AM",
                          style: TextThemeProvider.bodyTextSmall),
                    ],
                  ),
                )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Text("Contact", style: TextThemeProvider.heading3),
            addHeight(8),
            Text("+345 111 222 33", style: TextThemeProvider.bodyTextSmall),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            Text("Address", style: TextThemeProvider.heading3),
            addHeight(8),
            Text("Marconi Street, Kern County, CA-93504",
                style: TextThemeProvider.bodyTextSmall),
          ],
        ),
      ),
    );
  }
}
