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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ...List.generate(
              5,
              (index) => GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Post Request",
                            style: TextThemeProvider.bodyTextSmall
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Today",
                              style: TextThemeProvider.bodyTextSecondary,
                            ),
                          ),
                          Text(
                            "Jhon Doe requested to post in your community page.",
                            style: TextThemeProvider.bodyTextSmall,
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("view more"))
                        ],
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
                          "Post Type",
                          style: TextThemeProvider.bodyTextSmall
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text("1 min.", style: TextThemeProvider.bodyTextSmall),
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
                  ],
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text("view more"))
          ],
        ),
      ),
    );
  }
}
