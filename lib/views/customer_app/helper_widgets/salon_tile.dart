import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerAppSalonTile extends StatelessWidget {
  const CustomerAppSalonTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.textFieldBorder,
              backgroundImage: NetworkImage(salon_image),
            ),
            title: Text("Green Scissors Salon",
                style: TextThemeProvider.bodyTextSmall
                    .copyWith(fontWeight: FontWeight.w600)),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 12, color: AppColors.activeButtonColor),
                addWidth(5),
                Text("Kern County, CA",
                    style: TextThemeProvider.helperText.copyWith(
                        color: AppColors.blackColor.withOpacity(0.4))),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("3 km ", style: TextThemeProvider.helperText),
                const Icon(Icons.star_border, size: 12)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("2.75", style: TextThemeProvider.helperText),
                    Text(" | ",
                        style: TextThemeProvider.helperText
                            .copyWith(color: AppColors.textFieldBorder)),
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: AppColors.activeButtonColor,
                      ),
                      itemCount: 5,
                      itemSize: 13.0,
                    ),
                  ],
                ),
                TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80))),
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.activeButtonColor)),
                    onPressed: () {},
                    child: Text("Join Queue",
                        style: TextThemeProvider.bodyTextSecondary
                            .copyWith(color: AppColors.whiteColor)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
