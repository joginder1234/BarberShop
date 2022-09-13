import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/common_register_form/gender_view.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/app_data_handler.dart';

class NameDetailView extends StatefulWidget {
  const NameDetailView({Key? key}) : super(key: key);

  @override
  State<NameDetailView> createState() => _NameDetailViewState();
}

class _NameDetailViewState extends State<NameDetailView> {
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
              Text("Enter your name", style: TextThemeProvider.heading1),
              addHeight(50),
              CustomTextFieldView(
                label: "First Name",
                hint: "Jhon",
              ),
              addHeight(25),
              CustomTextFieldView(
                label: "Last Name",
                hint: "Doe",
              ),
              addHeight(25),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushTo(context, const GenderDetailView()))
            ],
          ),
        )),
      ),
    );
  }
}
