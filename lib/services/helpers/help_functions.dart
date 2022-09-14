import 'package:barbershop/services/helpers/toast.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/customer_app/bottom_nav_bar.dart';
import '../stylesheet/colors.dart';

getIcon({bool isSolid = false}) =>
    isSolid ? SolidAppIcons() : OutlinedAppIcons();

/// Screen Sizes */
getWidth(BuildContext context) => MediaQuery.of(context).size.width;
getHeight(BuildContext context) => MediaQuery.of(context).size.height;
SizedBox addHeight(double height) => SizedBox(height: height);
SizedBox addWidth(double width) => SizedBox(width: width);

/// ScreenSize Validation */
bool isSmallScreen(BuildContext context) =>
    MediaQuery.of(context).size.width < 350;

/* Keyboard Activity Handler */
unfocus(BuildContext context) => FocusScope.of(context).unfocus();

/// Navigation Helpers */
pushTo(BuildContext context, Widget child) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));
pushToandRemove(BuildContext context, Widget child) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => child), (route) => false);
popView(BuildContext context) => Navigator.of(context).pop();

/* Gender List */
List<String> genders = ["Male", "Female", "Other"];

/* Custome App Bar with Back Button Only */
PreferredSizeWidget emptyAppBar({String title = '', double elevation = 1}) =>
    AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: title == '' ? 0 : elevation,
      foregroundColor: AppColors.blackColor,
      centerTitle: true,
      title:
          title == '' ? null : Text(title, style: TextThemeProvider.heading1),
    );

getRoute(BuildContext context, String role) {
  switch (role) {
    case "customer":
      return pushTo(context, const BottomNavScreen());
    case "salon":
      return showToast("Comming Soon");
    case "barber":
      return showToast("Comming Soon");
    default:
      return null;
  }
}

textButton({required onTap, required text}) {
  return TextButton(
      onPressed: () {
        onTap();
      },
      child: Text(text));
}

homeSalonWork(
    {required BuildContext context,
    required title,
    required subtitle,
    required icon,
    required onTap}) {
  return GestureDetector(
    onTap: () => onTap,
    child: Card(
      elevation: 1.4,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.43,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            addWidth(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextThemeProvider.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: TextThemeProvider.bodyTextSmall
                      .copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
