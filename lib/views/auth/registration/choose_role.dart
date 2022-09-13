import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/auth/registration/common_register_form/phone_view.dart';
import 'package:barbershop/views/auth/registration/role_choose_tile.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/stylesheet/image_provider.dart';

class ChooseProfileRole extends StatefulWidget {
  const ChooseProfileRole({Key? key}) : super(key: key);

  @override
  State<ChooseProfileRole> createState() => _ChooseProfileRoleState();
}

class _ChooseProfileRoleState extends State<ChooseProfileRole> {
  List<UserRoleTile> userRoleType = [
    UserRoleTile("Salon", AppImageProvider.salonIcon, false),
    UserRoleTile("Customer", AppImageProvider.customerIcon, false),
    UserRoleTile("Barber", AppImageProvider.barberIcon, false),
  ];
  selectUser(int index) {
    for (var element in userRoleType) {
      element == userRoleType[index]
          ? setState(() => element.isActive = true)
          : setState(() => element.isActive = false);
    }
  }

  var activeRole;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to\n$appName",
                      style: TextThemeProvider.heading1.copyWith(fontSize: 30)),
                  Text("Select your role",
                      style: TextThemeProvider.bodyTextSmall),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 10,
                          spacing: 10,
                          children: List.generate(
                              userRoleType.length,
                              (i) => InkWell(
                                    onTap: () {
                                      selectUser(i);
                                      database.setUserRole(i);
                                    },
                                    child: RoleChooseTileCard(
                                        icon: userRoleType[i].icon,
                                        title: userRoleType[i].title,
                                        isActive: userRoleType[i].isActive),
                                  )),
                        ),
                      ),
                    ),
                  ),
                  ExpandedButtonView(
                      isDisabled: userRoleType
                          .every((element) => element.isActive == false),
                      title: "Continue",
                      ontap: () => pushTo(context, const PhoneDetailScreen()))
                ],
              ))),
    );
  }
}

class UserRoleTile {
  String title, icon;
  bool isActive;
  UserRoleTile(this.title, this.icon, this.isActive);
}
