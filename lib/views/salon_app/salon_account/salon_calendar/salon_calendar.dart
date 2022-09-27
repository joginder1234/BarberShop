import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_service_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SalonAppCalendarView extends StatefulWidget {
  const SalonAppCalendarView({super.key});

  @override
  State<SalonAppCalendarView> createState() => _SalonAppCalendarViewState();
}

class _SalonAppCalendarViewState extends State<SalonAppCalendarView> {
  @override
  void initState() {
    super.initState();
    getSession();
  }

  getSession() {
    final db = Provider.of<AppDataProvider>(context, listen: false);
    db.resetService();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDataProvider>(context);
    bool isSelected(String service) => database.getSelectedService == service;
    final isSmallScreen = getWidth(context) < 360;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Calendar", elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Opening Time",
                    style: TextThemeProvider.bodyText,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      OutlinedAppIcons.editIcon,
                      color: AppColors.primaryColor,
                      width: 20,
                    ),
                  ),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      "Monday-Friday",
                      style: TextThemeProvider.bodyTextSmall
                          .copyWith(color: AppColors.blackLightColor),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text("● 7:30-11:30 AM",
                            style: TextThemeProvider.bodyTextSmall),
                        Text("● 1:30-5:30 PM",
                            style: TextThemeProvider.bodyTextSmall),
                      ],
                    ),
                  ),
                )
              ]),
              addHeight(15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Text("Saturday-Sunday",
                          style: TextThemeProvider.bodyTextSmall
                              .copyWith(color: AppColors.blackLightColor)),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text("● 7:30-11:30 AM",
                              style: TextThemeProvider.bodyTextSmall),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              addHeight(30),
              Text(
                "Todays Services",
                style: TextThemeProvider.bodyText,
              ),
              Text(
                "Hold on the service to change status.",
                style: TextThemeProvider.bodyTextSmall.copyWith(
                  color: AppColors.blackLightColor,
                ),
              ),
              addHeight(20),
              Expanded(
                child: SizedBox(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        categoryList.length > 7 ? 8 : categoryList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isSmallScreen ? 2 : 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1),
                    itemBuilder: (context, i) {
                      final item = categoryList[i];
                      return InkWell(
                        onTap: () => database.selectService(item.title),
                        child: SalonServiceTileWidget(
                          isSelected: isSelected(item.title),
                          item: item,
                        ),
                      );
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
