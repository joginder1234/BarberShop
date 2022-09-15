import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/helpers/toast.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/join_queue/select_service.dart';
import 'package:barbershop/views/customer_app/join_queue/select_specialist.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_profile_views/about_salon.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_profile_views/salon_gallary.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_profile_views/salon_reviews.dart';
import 'package:barbershop/views/customer_app/salon_profile/salon_profile_views/salon_service.dart';
import 'package:barbershop/widgets/custom_action_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../widgets/button_theme.dart';

class CustomerAppSalonProfileHome extends StatefulWidget {
  const CustomerAppSalonProfileHome({super.key});

  @override
  State<CustomerAppSalonProfileHome> createState() =>
      _CustomerAppSalonProfileHomeState();
}

class _CustomerAppSalonProfileHomeState
    extends State<CustomerAppSalonProfileHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Widget> _tabViewChilds = [
    const CustomerAppSalonAboutView(),
    const CustomerAppSalonServicesView(),
    const CustomerAppSalonGallaryView(),
    const CustomerAppSalonReviewsView()
  ];

  final List<Tab> _tabBtns = [
    const Tab(
      text: "About",
    ),
    const Tab(
      text: "Services",
    ),
    const Tab(
      text: "Gallary",
    ),
    const Tab(
      text: "Review",
    )
  ];

  int _currentTabView = 0;
  int slidIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() => slidIndex = _tabController!.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDataProvider>(context);
    bool isSelected = database.getSelectedService != "";
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SalonHeaderView(),
          TabBar(
            dragStartBehavior: DragStartBehavior.down,
            onTap: (value) => setState(() => _currentTabView = value),
            tabs: _tabBtns,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.activeButtonColor,
            labelColor: AppColors.activeButtonColor,
            unselectedLabelColor: AppColors.blackLightColor,
            labelStyle: TextThemeProvider.bodyTextSmall
                .copyWith(fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextThemeProvider.bodyTextSmall,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TabBarView(
                dragStartBehavior: DragStartBehavior.down,
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: _tabViewChilds,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: (slidIndex == 2 || slidIndex == 3)
          ? null
          : Padding(
              padding: const EdgeInsets.all(20),
              child: ExpandedButtonView(
                  title: "Join Queue", ontap: () => onBtnTap(isSelected)),
            ),
    );
  }

  onBtnTap(bool isSelected) {
    if (slidIndex == 0) {
      pushTo(context, const CustomerAppSelectServiceView());
    } else if (slidIndex == 1 && isSelected) {
      pushTo(context, const CustomerAppSelectSpecialistView());
    } else {
      showToast("Please select a service to continue");
    }
  }
}

class SalonHeaderView extends StatelessWidget {
  const SalonHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: SizedBox(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            salon_image,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: getWidth(context),
              height: getWidth(context) * 0.3,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, AppColors.blackColor],
                      end: AlignmentDirectional.bottomCenter,
                      begin: AlignmentDirectional.topCenter)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: getWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text("Green Scissors day salon",
                        style: TextThemeProvider.heading2
                            .copyWith(color: AppColors.whiteColor)),
                  )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(TextSpan(
                            text: "4.5 ",
                            style: TextThemeProvider.bodyTextSmall
                                .copyWith(color: AppColors.whiteColor),
                            children: [
                              TextSpan(
                                  text: "★",
                                  style: TextThemeProvider.bodyTextSmall
                                      .copyWith(
                                          color: AppColors.statusPendingColor))
                            ])),
                        CustomActionButton(
                            label: "Open", btnColor: AppColors.statusGoodColor)
                      ],
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
