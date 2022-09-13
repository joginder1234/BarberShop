import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/views/customer_app/account/customer_account.dart';
import 'package:barbershop/views/customer_app/customer_home.dart';
import 'package:barbershop/views/customer_app/customer_news.dart';
import 'package:barbershop/views/customer_app/customer_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screenNav = [
    const CustomerHomePage(),
    const CustomerAppSearchView(),
    const CustomerAppNewsView(),
    const CustomerAppAccountView()
  ];
  final List<BottomNavClass> _bottomBarItems = [
    BottomNavClass("Home", OutlinedAppIcons.homeIcon),
    BottomNavClass("Search", OutlinedAppIcons.searchIcon),
    BottomNavClass("News", OutlinedAppIcons.documentIcon),
    BottomNavClass("My Account", OutlinedAppIcons.profileIcon)
  ];

  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor: AppColors.whiteColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentScreenIndex,
          onTap: (value) => setState(() => _currentScreenIndex = value),
          selectedItemColor: AppColors.activeButtonColor,
          items: _bottomBarItems
              .map((e) => BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(e.icon,
                      color: AppColors.activeButtonColor),
                  label: e.title,
                  icon: SvgPicture.asset(e.icon)))
              .toList()),
      body: _screenNav[_currentScreenIndex],
    );
  }
}

class BottomNavClass {
  String title, icon;
  BottomNavClass(this.title, this.icon);
}
