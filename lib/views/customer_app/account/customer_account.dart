import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/FAQs/customer_faq.dart';
import 'package:barbershop/views/customer_app/account/favorites/customer_favorite.dart';
import 'package:barbershop/views/customer_app/account/help_support/customer_help.dart';
import 'package:barbershop/views/customer_app/account/profile/profile.dart';
import 'package:barbershop/views/customer_app/account/track_queue/track_my_queue.dart';
import 'package:flutter/material.dart';

class CustomerAppAccountView extends StatefulWidget {
  const CustomerAppAccountView({Key? key}) : super(key: key);

  @override
  State<CustomerAppAccountView> createState() => _CustomerAppAccountViewState();
}

class _CustomerAppAccountViewState extends State<CustomerAppAccountView> {
  final List<AccountBtnClass> _btn = [
    AccountBtnClass("Profile", "profile"),
    AccountBtnClass("Track my Queue", 'trackQueue'),
    AccountBtnClass("Favorites", 'favorites'),
    AccountBtnClass("FAQ's", 'faq'),
    AccountBtnClass("Help & Support", 'help'),
    AccountBtnClass("Terms & Conditions", ''),
    AccountBtnClass("Privacy Policy", ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My Account", style: TextThemeProvider.heading1),
              ],
            ),
          ),
          addHeight(23),
          const Divider(),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                      itemBuilder: (context, i) {
                        final item = _btn[i];
                        return ListTile(
                          onTap: () => getnavigation(item.route),
                          title: Text(item.title,
                              style: TextThemeProvider.heading3),
                        );
                      },
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: _btn.length)))
        ],
      )),
    );
  }

  getnavigation(String route) {
    switch (route) {
      case "profile":
        return pushTo(context, const CustomerProfileView());
      case "trackQueue":
        return pushTo(context, const CustomerTrackQueue());
      case "favorites":
        return pushTo(context, const CustomerFavoriteView());
      case "faq":
        return pushTo(context, const CustomerFAQsView());
      case "help":
        return pushTo(context, const CustomerHelpAndSupportView());
      default:
        return null;
    }
  }
}

class AccountBtnClass {
  String title;
  String route;
  AccountBtnClass(this.title, this.route);
}
