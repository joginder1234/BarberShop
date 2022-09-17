import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_service_tile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/models/category_model.dart';
import '../../../services/stylesheet/colors.dart';
import '../../../services/stylesheet/text_theme.dart';
import '../../customer_app/join_queue/select_service.dart';
import 'salon_add_new_service.dart';

class SalonServiceSelectImage extends StatefulWidget {
  const SalonServiceSelectImage({super.key});

  @override
  State<SalonServiceSelectImage> createState() =>
      _SalonServiceSelectImageState();
}

class _SalonServiceSelectImageState extends State<SalonServiceSelectImage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDataProvider>(context);
    bool isSelected(String service) => database.getSelectedService == service;
    final isSmallScreen = getWidth(context) < 360;
    return Scaffold(
      appBar: emptyAppBar(title: "Select Image", elevation: 0),
      body: SafeArea(
        child: Column(
          children: [
            addHeight(20),
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
                    return InkWell(
                      onTap: () => database.selectService(item.title),
                      child: SalonServiceTileWidget(
                          isSelected: isSelected(item.title), item: item),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
          title: "Select",
          ontap: () {
            pushTo(context, const AddNewService());
          },
        ),
      ),
    );
  }
}
