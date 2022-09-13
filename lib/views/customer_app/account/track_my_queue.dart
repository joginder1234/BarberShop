import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomerTrackQueue extends StatelessWidget {
  const CustomerTrackQueue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String queueId = "hgfjsdfkj4987rfdfkhbd7";
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Track My Queue", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomCardWidget(
                width: getWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      QrImage(
                        data: queueId,
                        size: getWidth(context) * 0.40,
                      ),
                      addHeight(10),
                      Center(
                        child: Text("ID: $queueId",
                            style: TextThemeProvider.bodyTextSmall),
                      ),
                      addHeight(10),
                      Center(
                        child: Text.rich(TextSpan(
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
                      ),
                      Center(
                        child: Text("1 Adult, 0 Child",
                            style: TextThemeProvider.bodyTextSmall),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
