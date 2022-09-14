import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/views/customer_app/bottom_nav_bar.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_chair_view.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_homepage.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_myaccount_view.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_news_view.dart';
import 'package:barbershop/views/salon_app/salon_bottom_page/salon_service_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class SalonBottomNavView extends StatefulWidget {
  const SalonBottomNavView({super.key});

  @override
  State<SalonBottomNavView> createState() => _SalonBottomNavViewState();
}

class _SalonBottomNavViewState extends State<SalonBottomNavView> {
  final List<Widget> _screenNav = [
    const SalonHomePage(),
    const SalonAppServiceView(),
    const SalonAppChairView(),
    const SalonAppNewsView(),
    const SalonAppAccountView(),
  ];

  final List<BottomNavClass> _bottombarItems = [
    BottomNavClass("Home", OutlinedAppIcons.homeIcon),
    BottomNavClass("Services", OutlinedAppIcons.serviceIcon),
    BottomNavClass("Chairs", OutlinedAppIcons.chairIcon),
    BottomNavClass("News", OutlinedAppIcons.documentIcon),
    BottomNavClass("My Account", OutlinedAppIcons.profileIcon),
  ];
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() => _currentScreenIndex = value),
        currentIndex: _currentScreenIndex,
        selectedItemColor: AppColors.activeButtonColor,
        backgroundColor: AppColors.whiteColor,
        elevation: 5,
        items: _bottombarItems
            .map((e) => BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(e.icon,
                    color: AppColors.activeButtonColor),
                label: e.title,
                icon: SvgPicture.asset(e.icon)))
            .toList(),
      ),
      body: _screenNav[_currentScreenIndex],
    );
  }
}
