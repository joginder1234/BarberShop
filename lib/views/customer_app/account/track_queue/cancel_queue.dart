import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/bottom_nav_bar.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class CustomerCancelQueueInfo extends StatefulWidget {
  const CustomerCancelQueueInfo({Key? key}) : super(key: key);

  @override
  State<CustomerCancelQueueInfo> createState() =>
      _CustomerCancelQueueInfoState();
}

class _CustomerCancelQueueInfoState extends State<CustomerCancelQueueInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Queue Cancelled!",
                style: TextThemeProvider.heading0,
              ),
              Text(
                "Your Queue has been cancelled by yourself. You can still join the same or the new one by clicking below.",
                textAlign: TextAlign.center,
                style: TextThemeProvider.bodyText,
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
            title: "Join Another Queue",
            ontap: () => pushToandRemove(context, const BottomNavScreen())),
      ),
    );
  }
}
