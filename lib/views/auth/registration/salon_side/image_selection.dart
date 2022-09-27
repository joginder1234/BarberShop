import 'dart:io';

import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/helpers/toast.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/salon_side/salon_alternate_phone.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SalonImageSelectionview extends StatefulWidget {
  const SalonImageSelectionview({Key? key}) : super(key: key);

  @override
  State<SalonImageSelectionview> createState() =>
      _SalonImageSelectionviewState();
}

class _SalonImageSelectionviewState extends State<SalonImageSelectionview> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _pickedImages = [];
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: db.getRegisterFormHeader()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Salon Image", style: TextThemeProvider.heading1),
              Text("You can upload upto $maxImagesOnSalonRegister images",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(30),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _pickedImages.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isSmallScreen(context) ? 3 : 4,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8),
                itemBuilder: (context, i) => i == _pickedImages.length
                    ? InkWell(
                        onTap: () => pickFile(), child: const imagePickerBox())
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_pickedImages[i].path),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: getWidth(context),
        padding: const EdgeInsets.all(16),
        child: ExpandedButtonView(
            isDisabled: _pickedImages.isEmpty,
            title: "Next",
            ontap: () =>
                pushTo(context, const SalonAlternatePhoneDetailView())),
      ),
    );
  }

  pickFile() async {
    var picked = await _picker.pickMultiImage();
    if (picked != null && picked.isNotEmpty) {
      if (_pickedImages.length + picked.length <= maxImagesOnSalonRegister) {
        setState(() {
          _pickedImages.addAll(picked);
        });
      } else {
        showToast("You can select upto $maxImagesOnSalonRegister Images only");
      }
    } else {
      null;
    }
  }
}

class imagePickerBox extends StatelessWidget {
  const imagePickerBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        padding: const EdgeInsets.all(10),
        borderType: BorderType.RRect,
        dashPattern: const [5, 2.5],
        strokeWidth: 1.2,
        color: AppColors.blackColor.withOpacity(0.3),
        radius: const Radius.circular(10),
        child: Center(
          child: Icon(Icons.add, color: AppColors.blackColor.withOpacity(0.3)),
        ));
  }
}
