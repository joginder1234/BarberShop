import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/join_queue/select_service.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_service_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerAppSalonServicesView extends StatefulWidget {
  const CustomerAppSalonServicesView({super.key});

  @override
  State<CustomerAppSalonServicesView> createState() =>
      _CustomerAppSalonServicesViewState();
}

class _CustomerAppSalonServicesViewState
    extends State<CustomerAppSalonServicesView> {
  var _selectedService;

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
    final isSmallScreen = getWidth(context) < 380;
    return Scaffold(
      body: GridView.builder(
          padding: EdgeInsets.zero,
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
                    onTap: () =>
                        pushTo(context, const CustomerAppSelectServiceView()),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "View more",
                            style: TextThemeProvider.bodyTextSecondary
                                .copyWith(color: AppColors.activeButtonColor),
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
    );
  }
}
