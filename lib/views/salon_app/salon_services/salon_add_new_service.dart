import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

import 'salon_service_select_image.dart';

class AddNewService extends StatelessWidget {
  const AddNewService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Add Service", elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Wrap(
            runSpacing: 20,
            children: [
              CustomTextFieldView(
                label: "Name",
                hint: "Name of Service",
              ),
              CustomTextFieldView(
                readOnly: true,
                label: "Category",
                hint: "Select Category",
                suffixIcon: OutlinedAppIcons.downArrow,
              ),
              CustomTextFieldView(
                readOnly: true,
                label: "Status",
                hint: "Active",
                suffixIcon: OutlinedAppIcons.downArrow,
              ),
              CustomTextFieldView(
                readOnly: true,
                label: "Chairs",
                hint: "All",
                suffixIcon: OutlinedAppIcons.downArrow,
              ),
              CustomTextFieldView(
                readOnly: true,
                ontap: () {
                  pushTo(context, const SalonServiceSelectImage());
                },
                label: "Image",
                hint: "Select",
                suffixIcon: OutlinedAppIcons.logout,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
          title: "Save",
          ontap: () {
            pushTo(context, const AddNewService());
          },
        ),
      ),
    );
  }
}
