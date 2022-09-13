import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/salon_side/address_detail.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonNameDetailView extends StatefulWidget {
  const SalonNameDetailView({Key? key}) : super(key: key);

  @override
  State<SalonNameDetailView> createState() => _SalonNameDetailViewState();
}

class _SalonNameDetailViewState extends State<SalonNameDetailView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: "Register Salon"),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter Salon name", style: TextThemeProvider.heading1),
              addHeight(50),
              CustomTextFieldView(
                label: "Salon",
                hint: "xxxx Salon",
              ),
              addHeight(30),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushTo(context, const SalonAddressInputView()))
            ],
          ),
        )),
      ),
    );
  }
}
