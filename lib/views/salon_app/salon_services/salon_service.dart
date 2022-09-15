import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/join_queue/select_service.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_service_tile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalonAppServiceView extends StatefulWidget {
  const SalonAppServiceView({super.key});

  @override
  State<SalonAppServiceView> createState() => _SalonAppServiceViewState();
}

class _SalonAppServiceViewState extends State<SalonAppServiceView> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDataProvider>(context);
    bool isSelected(String service) => database.getSelectedService == service;
    final isSmallScreen = getWidth(context) < 380;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Text("Services", style: TextThemeProvider.heading1),
          ),
          Center(
            child: Text(
              "Tap on any service to remove or edit",
              style: TextThemeProvider.bodyTextSmall,
              textAlign: TextAlign.center,
            ),
          ),
          addHeight(10),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: categoryList.length > 7 ? 8 : categoryList.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 2 : 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1),
                  itemBuilder: (context, i) {
                    final item = categoryList[i];
                    return i == 7
                        ? InkWell(
                            onTap: () => pushTo(
                                context, const CustomerAppSelectServiceView()),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Text(
                                    "View more",
                                    style: TextThemeProvider.bodyTextSecondary
                                        .copyWith(
                                            color: AppColors.activeButtonColor),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () => database.selectService(item.title),
                            child: SalonServiceTileWidget(
                                isSelected: isSelected(item.title), item: item),
                          );
                  }),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(title: "Add New Service", ontap: () {}),
      ),
    );
  }
}
