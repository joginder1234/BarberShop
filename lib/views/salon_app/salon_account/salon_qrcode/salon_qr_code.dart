import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SalonQrCode extends StatelessWidget {
  const SalonQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    String queueId = "sdjflsjfoidjow291u3021";
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "QR Code"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Green Scissors day salon",
              style: TextThemeProvider.heading2
                  .copyWith(fontWeight: FontWeight.w800),
            ),
            addHeight(10),
            QrImage(
              data: queueId,
              size: getWidth(context) * 0.60,
            ),
            addHeight(10),
            Text("ID: $queueId", style: TextThemeProvider.bodyTextSmall),
            addHeight(MediaQuery.of(context).size.height * 0.15),
            TextButton(onPressed: () {}, child: const Text("Create QR Code")),
            ExpandedButtonView(title: "Download", ontap: () {}),
          ],
        ),
      ),
    );
  }
}
