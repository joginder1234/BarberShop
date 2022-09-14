import 'package:barbershop/views/auth/registration/common_register_form/email_view.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/app_data_handler.dart';
import '../../../../services/helpers/help_functions.dart';
import '../../../../services/stylesheet/colors.dart';
import '../../../../services/stylesheet/text_theme.dart';
import '../../../../widgets/button_theme.dart';

class GenderDetailView extends StatefulWidget {
  const GenderDetailView({Key? key}) : super(key: key);

  @override
  State<GenderDetailView> createState() => _GenderDetailViewState();
}

class _GenderDetailViewState extends State<GenderDetailView> {
  String selectedGender = "Male";

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
              Text("Select your Gender", style: TextThemeProvider.heading1),
              addHeight(50),
              CustomDropdownButton(
                  label: "Gender",
                  onChanged: (v) =>
                      setState(() => selectedGender = v.toString()),
                  value: selectedGender,
                  items: genders),
              addHeight(25),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushTo(context, const EmailDetailView()))
            ],
          ),
        )),
      ),
    );
  }
}
