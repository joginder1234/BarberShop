import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/views/auth/registration/barber_side/barber_detail.dart';
import 'package:barbershop/views/auth/registration/customer_side/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../services/helpers/help_functions.dart';
import '../../../../services/stylesheet/colors.dart';
import '../../../../services/stylesheet/text_theme.dart';
import '../../../../widgets/button_theme.dart';
import '../../../../widgets/textfield.dart';
import '../salon_side/salon_name.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({Key? key}) : super(key: key);

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
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
              Text("Create Password", style: TextThemeProvider.heading1),
              Text("You will need it to sign in to the application",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(34),
              CustomTextFieldView(
                label: "Password",
                hint: "********",
              ),
              addHeight(30),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next", ontap: () => getNavigation(db.getSelectedrole))
            ],
          ),
        )),
      ),
    );
  }

  getNavigation(int i) {
    switch (i) {
      case 0:
        return pushTo(context, const SalonNameDetailView());
      case 1:
        return pushTo(context, const CustomerRegisterComplete());
      default:
        return pushTo(context, const BarberDetailsView());
    }
  }
}
