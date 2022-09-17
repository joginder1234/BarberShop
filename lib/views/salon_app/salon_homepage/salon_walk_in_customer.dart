import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/home_salon_tile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SalonWalkInCustomer extends StatefulWidget {
  const SalonWalkInCustomer({super.key});

  @override
  State<SalonWalkInCustomer> createState() => _SalonWalkInCustomerState();
}

class _SalonWalkInCustomerState extends State<SalonWalkInCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Walk-In customers", elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextFieldView(
                hint: "Jhon Doe",
                label: "Name",
              ),
              addHeight(20),
              CustomTextFieldView(
                hint: "+2382932",
                label: "Mobile Number",
              ),
              addHeight(20),
              ExpandedButtonView(title: "Add To Queue", ontap: () {}),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Today's Walk-in",
                  style: TextThemeProvider.heading3
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return HomeSalonTile(
                          serialNumber: index + 1,
                          title: "Jhone Doe",
                          subtitle: "2:00PM, Barber Name",
                          status: "Confirmed",
                          rating: "4.8",
                          distance: "3KM",
                          button: "Skip",
                          onTap: () {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
