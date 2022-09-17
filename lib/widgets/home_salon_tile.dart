import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class HomeSalonTile extends StatefulWidget {
  int serialNumber;
  String title;
  String subtitle;
  String? rating;
  String status;
  String distance;
  String button;
  Function onTap;
  HomeSalonTile({
    Key? key,
    this.serialNumber = 1,
    required this.title,
    required this.subtitle,
    this.rating,
    required this.status,
    required this.distance,
    required this.button,
    required this.onTap,
  });

  @override
  State<HomeSalonTile> createState() => _HomeSalonTileState();
}

class _HomeSalonTileState extends State<HomeSalonTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${widget.serialNumber}. ${widget.title}",
                        style: TextThemeProvider.bodyTextSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor),
                        children: [
                          TextSpan(
                            text: "   ${widget.rating}",
                            style: TextThemeProvider.bodyTextSecondary.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                      size: 15,
                    )
                  ],
                ),
                Text(widget.subtitle,
                    style: TextThemeProvider.helperText.copyWith(
                        color: AppColors.blackColor.withOpacity(0.4))),
                addHeight(5),
                Text(
                  widget.status,
                  style: TextThemeProvider.bodyTextSmall.copyWith(
                      color: AppColors.statusGoodColor,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  widget.distance,
                  style: TextThemeProvider.bodyTextSmall,
                ),
                CustomActionButton(label: widget.button),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
