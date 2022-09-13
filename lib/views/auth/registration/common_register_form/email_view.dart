import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/common_register_form/create_pass_view.dart';

import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../backend/app_data_handler.dart';

class EmailDetailView extends StatefulWidget {
  const EmailDetailView({Key? key}) : super(key: key);

  @override
  State<EmailDetailView> createState() => _EmailDetailViewState();
}

class _EmailDetailViewState extends State<EmailDetailView> {
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
              Text("Enter your email", style: TextThemeProvider.heading1),
              Text("You will need it to sign in to the application",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(34),
              CustomTextFieldView(
                label: "email",
                hint: "xxxxx@email.com",
              ),
              addHeight(30),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushTo(context, const CreatePasswordView()))
            ],
          ),
        )),
      ),
    );
  }
}
