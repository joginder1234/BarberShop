import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/helper_widgets/home_salon_tile.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_homepage.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Walk-In customers",
          style:
              TextThemeProvider.heading3.copyWith(color: AppColors.blackColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            pushToandRemove(context, const SalonHomePage());
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blackColor,
          ),
        ),
      ),
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
                margin: const EdgeInsets.only(top: 30),
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
                      return const HomeSalonTile();
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
