import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_chair/salon_add_new_chair.dart';
import 'package:barbershop/views/salon_app/salon_chair/salon_edit_chair_view.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class SalonAppChairView extends StatelessWidget {
  const SalonAppChairView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Center(
                child: Text("Chairs", style: TextThemeProvider.heading1),
              ),
              Center(
                child: Text(
                  "Tap on any Chair to remove or edit",
                  style: TextThemeProvider.bodyTextSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              addHeight(20),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: ListTile(
                          onTap: () {
                            pushTo(context, const SalonAppEditChairView());
                          },
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                profile_image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            "CH01",
                            style: TextThemeProvider.bodyTextSmall
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            "Esther Howard",
                            style: TextThemeProvider.helperText
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                          trailing: const Text("4.0 ⭐"),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textButton(onTap: () {}, text: "Remove Chair"),
            addHeight(8),
            ExpandedButtonView(
              title: "Add New Chair",
              ontap: () {
                pushTo(context, const SalonAppAddNewChairView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
