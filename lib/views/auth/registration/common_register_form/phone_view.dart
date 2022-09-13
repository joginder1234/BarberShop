import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/phone_auth/otp_view.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneDetailScreen extends StatefulWidget {
  const PhoneDetailScreen({Key? key}) : super(key: key);

  @override
  State<PhoneDetailScreen> createState() => _PhoneDetailScreenState();
}

class _PhoneDetailScreenState extends State<PhoneDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: db.getRegisterFormHeader()),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your Mobile No.", style: TextThemeProvider.heading1),
              Text("You will need it to sign in to the application",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(30),
              CustomTextFieldView(
                numPad: true,
                label: "Mobile Phone",
                hint: "xxxxxx1234",
              ),
              addHeight(30),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushTo(context, PhoneOtpView(isRegister: true)))
            ],
          ),
        )),
      ),
    );
  }
}
