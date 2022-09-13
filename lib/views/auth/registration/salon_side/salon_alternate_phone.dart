import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/salon_side/wait_for_approval_salon.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalonAlternatePhoneDetailView extends StatefulWidget {
  const SalonAlternatePhoneDetailView({Key? key}) : super(key: key);

  @override
  State<SalonAlternatePhoneDetailView> createState() =>
      _SalonAlternatePhoneDetailViewState();
}

class _SalonAlternatePhoneDetailViewState
    extends State<SalonAlternatePhoneDetailView> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        appBar: emptyAppBar(title: db.getRegisterFormHeader()),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Salon Phone no.", style: TextThemeProvider.heading1),
              Text("Enter a phone no. so the customers can contact directly",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(40),
              CustomTextFieldView(
                numPad: true,
                label: "Phone",
                hint: "xxxxxx1234",
              ),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () =>
                      pushTo(context, const WaitForSalonApprovalView()))
            ],
          ),
        )),
      ),
    );
  }
}
