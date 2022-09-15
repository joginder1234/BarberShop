import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/FAQs/customer_faq.dart';
import 'package:barbershop/views/customer_app/account/customer_account.dart';
import 'package:barbershop/views/customer_app/account/help_support/customer_help.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_offer/salon_offer.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_profile/salon_profile.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_qr_code.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_waitinglist.dart';
import 'package:flutter/material.dart';

class SalonAccountView extends StatefulWidget {
  const SalonAccountView({super.key});

  @override
  State<SalonAccountView> createState() => _SalonAccountViewState();
}

class _SalonAccountViewState extends State<SalonAccountView> {
  final List<AccountBtnClass> _btn = [
    AccountBtnClass("Profile", "profile"),
    AccountBtnClass("Salon Offers", 'salonOffer'),
    AccountBtnClass("Reviews and Ratings", ''),
    AccountBtnClass("My Waiting List", 'waitinglist'),
    AccountBtnClass("Manage Calendar", ''),
    AccountBtnClass("Qr Code", 'qrcode'),
    AccountBtnClass("FAQ's", 'faq'),
    AccountBtnClass("Help & Support", 'help'),
    AccountBtnClass("Terms & Conditions", 'termcondition'),
    AccountBtnClass("Privacy Policy", 'privacypolicy'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My Account", style: TextThemeProvider.heading1),
              ],
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
        ),
      ),
    );
  }

  getnavigation(String route) {
    switch (route) {
      case "profile":
        return pushTo(context, const SalonAppProfile());
      case "salonOffer":
        return pushTo(context, const SalonOfferAppView());
      // case "review":
      //   return pushTo(context, const SalonAccountView());
      case "waitinglist":
        return pushTo(context, const SalonWaitingList());
      // case "managecalendar":
      //   return pushTo(context, const SalonAccountView());
      case "qrcode":
        return pushTo(context, const SalonQrCode());
      case "faq":
        return pushTo(context, const CustomerFAQsView());
      case "help":
        return pushTo(context, const CustomerHelpAndSupportView());
      // case "termcondition":
      //   return pushTo(context, const SalonAccountView());
      // case "privacypolicy":
      //   return pushTo(context, const SalonAccountView());
      default:
        return null;
    }
  }
}
