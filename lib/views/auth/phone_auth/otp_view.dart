import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/common_register_form/name_view.dart';
import 'package:barbershop/views/customer_app/bottom_nav_bar.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../backend/app_data_handler.dart';

class PhoneOtpView extends StatefulWidget {
  bool isRegister;
  String role;
  PhoneOtpView({Key? key, this.isRegister = false, this.role = ''})
      : super(key: key);

  @override
  State<PhoneOtpView> createState() => _PhoneOtpViewState();
}

class _PhoneOtpViewState extends State<PhoneOtpView> {
  final TextEditingController _pinCtrl = TextEditingController();
  final FocusNode _otpfocus = FocusNode();
  String otpCode = '';
  @override
  void initState() {
    super.initState();
  }

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
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter the Code", style: TextThemeProvider.heading1),
              Text(
                  "Enter the four-digit code that was sent to you at +38009651719",
                  style: TextThemeProvider.bodyText),
              addHeight(35),
              PinCodeTextField(
                  autoFocus: true,
                  focusNode: _otpfocus,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      borderWidth: 0.5,
                      disabledColor: AppColors.blackColor.withOpacity(0.02),
                      shape: PinCodeFieldShape.box,
                      inactiveColor: AppColors.blackColor.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15)),
                  controller: _pinCtrl,
                  appContext: (context),
                  length: 6,
                  onChanged: ((code) =>
                      code.length == 6 ? unfocus(context) : null)),
              addHeight(35),
              TextButton(
                  onPressed: () {},
                  child: Text("Didn't get the code?",
                      style: TextThemeProvider.bodyText)),
              addHeight(15),
              ExpandedButtonView(
                isDisabled: _pinCtrl.text.length < 6,
                title: "Continue",
                ontap: _pinCtrl.text.length < 6
                    ? () {}
                    : () => widget.isRegister
                        ? pushTo(context, const NameDetailView())
                        : pushTo(context, const BottomNavScreen()),
              )
            ],
          ),
        )),
      ),
    );
  }
}
