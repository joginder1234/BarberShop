import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config.dart';
import '../../../services/helpers/help_functions.dart';
import '../../../services/stylesheet/colors.dart';
import '../../../services/stylesheet/text_theme.dart';

class CustomerAppOfferTile extends StatelessWidget {
  const CustomerAppOfferTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: getWidth(context) * 0.75,
          height: getWidth(context) * 0.50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  width: getWidth(context) * 0.75,
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //     image: NetworkImage(salon_image), fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: salon_image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 242, 242, 242),
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 242, 242, 242),
                            ],
                            stops: [
                              0.1,
                              0.3,
                              0.4,
                            ],
                            begin: Alignment(-1.0, -0.3),
                            end: Alignment(1.0, 0.3),
                            tileMode: TileMode.clamp,
                          ),
                          child: Image.network(salon_image, fit: BoxFit.cover)),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              CustomDescriptionTile(
                title: "Personality Boy Event",
                subtitle: "Oct 8-Oct 12",
                discount: "10",
              )
            ],
          ),
        ));
  }
}

class CustomDescriptionTile extends StatelessWidget {
  String title, subtitle, discount;

  CustomDescriptionTile(
      {Key? key, this.title = '', this.subtitle = '', this.discount = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextThemeProvider.bodyText),
                Text(subtitle,
                    style: TextThemeProvider.helperText.copyWith(
                        color: AppColors.blackColor.withOpacity(0.4))),
              ],
            ),
          )),
          Text.rich(TextSpan(
              text: "$discount%",
              style: TextThemeProvider.heading3.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.activeButtonColor),
              children: [
                TextSpan(
                    text: "  OFF",
                    style: TextThemeProvider.helperText
                        .copyWith(color: AppColors.activeButtonColor))
              ]))
        ],
      ),
    );
  }
}
