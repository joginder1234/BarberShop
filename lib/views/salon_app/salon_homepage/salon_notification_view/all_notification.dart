import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ...List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        popView(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 20,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Post Request  ",
                                    style: TextThemeProvider.bodyTextSmall
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  customMessageDot(
                                      color: AppColors.statusGoodColor)
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Today",
                                  style: TextThemeProvider.bodyTextSecondary
                                      .copyWith(
                                          color: AppColors.blackLightColor),
                                ),
                              ),
                              Text(
                                "Jhon Doe requested to post in your community page.",
                                style: TextThemeProvider.bodyTextSmall
                                    .copyWith(color: AppColors.blackLightColor),
                                textAlign: TextAlign.center,
                              ),
                              textButton(onTap: () {}, text: "View Request")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Post",
                            style: TextThemeProvider.bodyTextSmall
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text("1 min.",
                              style: TextThemeProvider.bodyTextSecondary),
                        ],
                      ),
                      addHeight(5),
                      Text(
                        "Davon lame posted in Green Scissors salon for the first time",
                        style: TextThemeProvider.bodyTextSmall
                            .copyWith(color: Colors.grey.shade500),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      addHeight(20),
                    ],
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("view more"))
            ],
          ),
        ),
      ),
    );
  }
}
