import 'dart:math';

import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/track_queue/cancel_queue.dart';
import 'package:barbershop/views/customer_app/account/track_queue/move_queue.dart';
import 'package:barbershop/views/customer_app/bottom_nav_bar.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomerTrackQueue extends StatelessWidget {
  bool isNewBooking;
  CustomerTrackQueue({Key? key, this.isNewBooking = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String queueId = "hgfjsdfkj4987rfdfkhbd7";
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: isNewBooking
          ? null
          : emptyAppBar(title: "Track My Queue", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isNewBooking
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                          child: Text("Successfully joined queue!",
                              textAlign: TextAlign.center,
                              style: TextThemeProvider.heading0)),
                    )
                  : const SizedBox(),
              CustomCardWidget(
                width: getWidth(context),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Center(
                          child: Opacity(
                              opacity: 0.06, child: Image.asset(appLogo))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          children: [
                            QrImage(
                              data: queueId,
                              size: getWidth(context) * 0.40,
                            ),
                            addHeight(10),
                            Text("ID: $queueId",
                                style: TextThemeProvider.bodyTextSmall),
                            addHeight(10),
                            Text.rich(TextSpan(
                                text: "G",
                                style: GoogleFonts.poppins(
                                    wordSpacing: 0,
                                    height: 0,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.activeButtonColor),
                                children: [
                                  TextSpan(
                                      text: "03",
                                      style: GoogleFonts.poppins(
                                          height: 0,
                                          fontSize: 60,
                                          fontWeight: FontWeight.w200,
                                          color: AppColors.blackColor))
                                ])),
                            Text("1 Adult, 0 Child",
                                style: TextThemeProvider.bodyText),
                            addHeight(10),
                            Text.rich(TextSpan(
                                text: "2 Customers ",
                                style: TextThemeProvider.bodyText.copyWith(
                                    color: AppColors.activeButtonColor),
                                children: [
                                  TextSpan(
                                      text: "are waiting for",
                                      style: TextThemeProvider.bodyTextSmall
                                          .copyWith(
                                              color: AppColors.blackColor
                                                  .withOpacity(0.4)))
                                ])),
                            addHeight(5),
                            Text("Devon Lane",
                                style: TextThemeProvider.heading2),
                            Text("(Green Scissors day salon)",
                                style: TextThemeProvider.bodyText
                                    .copyWith(fontStyle: FontStyle.italic)),
                            addHeight(25),
                            Text("Estimated time for your slot",
                                style: TextThemeProvider.bodyText),
                            addHeight(15),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(context) * 0.17),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("02",
                                          style: GoogleFonts.poppins(
                                              fontSize: 28)),
                                      Text("Hours",
                                          style: TextThemeProvider.helperText),
                                    ],
                                  ),
                                  Text(":",
                                      style: GoogleFonts.poppins(fontSize: 28)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("31",
                                          style: GoogleFonts.poppins(
                                              fontSize: 28)),
                                      Text("Minutes",
                                          style: TextThemeProvider.helperText),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            addHeight(20),
                            TextButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    OutlinedAppIcons.downloadIcon,
                                    color: AppColors.activeButtonColor),
                                label: Text(
                                  "Download",
                                  style: TextThemeProvider.heading3.copyWith(
                                      color: AppColors.activeButtonColor),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addHeight(25),
              Text(
                "Other Chairs",
                style: TextThemeProvider.heading2,
              ),
              addHeight(10),
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
                          ))
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
              const Divider(),
              addHeight(5),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text("View all",
                        style: TextThemeProvider.bodyTextSmall
                            .copyWith(color: AppColors.activeButtonColor))),
              ),
              addHeight(25),
              isNewBooking
                  ? Column(
                      children: [
                        ExpandedButtonView(
                            title: "HOME",
                            ontap: () =>
                                pushTo(context, const BottomNavScreen()),
                            btnColor: AppColors.blackfaddedColor,
                            titleColor: AppColors.activeButtonColor),
                        addHeight(10),
                        ExpandedButtonView(
                            title: "Join Another Queue", ontap: () {}),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExpandedButtonView(title: "Refresh", ontap: () {}),
                        addHeight(10),
                        ExpandedButtonView(
                            title: "Cancel Queue",
                            ontap: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    const CancelQueueDialog()),
                            btnColor: AppColors.whiteColor,
                            titleColor: AppColors.activeButtonColor)
                      ],
                    ),
              addHeight(10),
              ExpandedButtonView(
                  title: "Move Queue",
                  ontap: () => pushTo(context, const CustomerMoveQueueView()),
                  btnColor: AppColors.whiteColor,
                  titleColor: AppColors.activeButtonColor),
            ],
          ),
        ),
      )),
    );
  }
}

class CancelQueueDialog extends StatelessWidget {
  const CancelQueueDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text("Do you really want to cancel the Queue from the salon?",
          textAlign: TextAlign.center, style: TextThemeProvider.heading2),
      actions: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: ExpandedButtonView(
                    radius: 80,
                    title: "Yes, I am sure",
                    ontap: () =>
                        pushTo(context, const CustomerCancelQueueInfo()),
                    titleColor: AppColors.activeButtonColor,
                    btnColor: AppColors.textFieldBorder),
              ),
            ),
            addWidth(5),
            Expanded(
              child: SizedBox(
                child: ExpandedButtonView(
                  radius: 80,
                  title: "No, by mistake",
                  ontap: () => popView(context),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
