import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:flutter/material.dart';

class CustomerAppSalonGallaryView extends StatefulWidget {
  const CustomerAppSalonGallaryView({super.key});

  @override
  State<CustomerAppSalonGallaryView> createState() =>
      _CustomerAppSalonGallaryViewState();
}

class _CustomerAppSalonGallaryViewState
    extends State<CustomerAppSalonGallaryView> {
  String selectedImage = salonImages.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addHeight(20),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(selectedImage), fit: BoxFit.cover)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.zoom_out_map_rounded,
                        color: AppColors.whiteColor)),
              ),
            ),
            addHeight(20),
            Wrap(
              runSpacing: 5,
              spacing: 5,
              alignment: WrapAlignment.center,
              children: salonImages
                  .map((e) => Opacity(
                        opacity: selectedImage == e ? 1 : 0.3,
                        child: GestureDetector(
                          onTap: () => setState(() => selectedImage = e),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(e), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
