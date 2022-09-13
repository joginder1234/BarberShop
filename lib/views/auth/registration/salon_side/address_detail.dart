import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/salon_side/image_selection.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalonAddressInputView extends StatefulWidget {
  const SalonAddressInputView({Key? key}) : super(key: key);

  @override
  State<SalonAddressInputView> createState() => _SalonAddressInputViewState();
}

class _SalonAddressInputViewState extends State<SalonAddressInputView> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: db.getRegisterFormHeader()),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Salon Address", style: TextThemeProvider.heading1),
                addHeight(30),
                CustomTextFieldView(
                  label: "Building No.",
                  hint: "Building No.",
                ),
                addHeight(20),
                CustomTextFieldView(
                  label: "Area/Locality",
                  hint: "Area/Locality",
                ),
                addHeight(20),
                CustomTextFieldView(
                  label: "Country",
                  hint: "Country",
                ),
                addHeight(20),
                CustomTextFieldView(
                  label: "State",
                  hint: "State",
                ),
                addHeight(20),
                CustomTextFieldView(
                  label: "City",
                  hint: "City",
                ),
                addHeight(20),
                CustomTextFieldView(
                  label: "Zip",
                  hint: "Zip",
                ),
                addHeight(20),
              ],
            ),
          ),
        )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          width: getWidth(context),
          child: ExpandedButtonView(
              title: "Next",
              ontap: () => pushTo(context, const SalonImageSelectionview())),
        ),
      ),
    );
  }
}
