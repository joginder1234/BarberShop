import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/join_queue/select_specialist.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../backend/app_data_handler.dart';
import '../../../services/models/category_model.dart';
import '../salon_profile/salon_service_tile.dart';

class CustomerAppSelectServiceView extends StatefulWidget {
  const CustomerAppSelectServiceView({super.key});

  @override
  State<CustomerAppSelectServiceView> createState() =>
      _CustomerAppSelectServiceViewState();
}

class _CustomerAppSelectServiceViewState
    extends State<CustomerAppSelectServiceView> {
  @override
  void initState() {
    getSession();
    super.initState();
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
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Select Service", elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
                "Our Salon is offering the following services you can select only one at a time to join queue",
                textAlign: TextAlign.center,
                style: TextThemeProvider.bodyTextSmall),
            addHeight(30),
            GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: categoryList.length,
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
                        isSelected: isSelected(item.title), item: item),
                  );
                }),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
            title: "Next",
            ontap: () => const CustomerAppSelectSpecialistView()),
      ),
    );
  }
}
