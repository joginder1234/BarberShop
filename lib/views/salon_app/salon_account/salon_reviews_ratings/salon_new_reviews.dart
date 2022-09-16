import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_reviews_ratings/salon_single_review.dart';
import 'package:barbershop/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class SalonNewReviews extends StatefulWidget {
  const SalonNewReviews({super.key});

  @override
  State<SalonNewReviews> createState() => _SalonNewReviewsState();
}

class _SalonNewReviewsState extends State<SalonNewReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: CustomActionButton(label: "Barber"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                      child: Text(
                    "25+ Reviews",
                    style: TextThemeProvider.bodyText,
                  )),
                ),
                Expanded(
                  child: SizedBox(
                    child: CustomActionButton(label: "Salon"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Column(
                          children: [
                            ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
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
                              style: TextThemeProvider.bodyTextSmall
                                  .copyWith(color: AppColors.blackLightColor),
                            ),
                            textButton(
                                onTap: () {
                                  pushTo(context, const SalonSingleReview());
                                },
                                text: "Read more"),
                            const Divider(),
                            addHeight(15),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
