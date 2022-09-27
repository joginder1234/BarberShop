import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/views/salon_app/salon_services/salon_service_select_image.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import '../../../widgets/button_theme.dart';

class SalonServiceEditAppView extends StatelessWidget {
  const SalonServiceEditAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Edit Service", elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Wrap(
            runSpacing: 20,
            children: [
              CustomTextFieldView(
                label: "Name",
                hint: "Facial",
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
                hint: "Ch01,Ch02,Ch03",
                suffixIcon: OutlinedAppIcons.downArrow,
              ),
              CustomTextFieldView(
                readOnly: true,
                ontap: () {
                  pushTo(context, const SalonServiceSelectImage());
                },
                label: "Image",
                hint: "FaceMask",
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
          ontap: () {},
        ),
      ),
    );
  }
}
