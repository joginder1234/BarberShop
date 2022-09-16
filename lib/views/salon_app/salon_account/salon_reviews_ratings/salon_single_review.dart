import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SalonSingleReview extends StatefulWidget {
  const SalonSingleReview({super.key});

  @override
  State<SalonSingleReview> createState() => _SalonSingleReviewState();
}

class _SalonSingleReviewState extends State<SalonSingleReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Reviews and Ratings", elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addHeight(15),
            ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        profile_image,
                        fit: BoxFit.cover,
                      )),
                ),
                title: Text(
                  "Arlene McCoy",
                  style: TextThemeProvider.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "2 days ago",
                  style: TextThemeProvider.helperText
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                trailing: const Text("4.0 ⭐")),
            Text(
              "Eu quam morbi laoreet consectetur et. Purus quis hendrerit consectetur tristique tincidunt augue amet. Vitae scelerisque egestas feugiat elit risus dictum etiam. Nisi, nibh pellentesque risus, diam consequat.",
              style:
                  TextThemeProvider.bodyTextSmall.copyWith(color: Colors.grey),
            ),
            addHeight(15),
            Text(
              "Add Reply",
              style: TextThemeProvider.bodyTextSecondary
                  .copyWith(color: AppColors.blackLightColor),
            ),
            CustomTextFieldView()
          ],
        ),
      )),
    );
  }
}
