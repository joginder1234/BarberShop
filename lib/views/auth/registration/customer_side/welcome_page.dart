import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/home/customer_home.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class CustomerRegisterComplete extends StatefulWidget {
  const CustomerRegisterComplete({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterComplete> createState() =>
      _CustomerRegisterCompleteState();
}

class _CustomerRegisterCompleteState extends State<CustomerRegisterComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Jhon Doe!", style: TextThemeProvider.heading1),
            Text("Start by exploring the salons nearby",
                style: TextThemeProvider.bodyTextSmall),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        width: getWidth(context),
        padding: const EdgeInsets.all(16),
        child: ExpandedButtonView(
            title: "Start Now",
            ontap: () => pushToandRemove(context, const CustomerHomePage())),
      ),
    );
  }
}
