import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_notification_view/all_notification.dart';
import 'package:barbershop/views/salon_app/salon_notification_view/new_notification.dart';
import 'package:flutter/material.dart';

class SalonNotification extends StatefulWidget {
  const SalonNotification({super.key});

  @override
  State<SalonNotification> createState() => _SalonNotificationState();
}

class _SalonNotificationState extends State<SalonNotification>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _tablist = [
    const Tab(
      text: "New",
    ),
    const Tab(
      text: "All",
    )
  ];

  final List<Widget> _tabViewList = [
    const NewNotification(),
    const AllNotification(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(
        title: "Notifications",
      ),
      body: Column(
        children: [
          TabBar(
              labelStyle: TextThemeProvider.bodyTextSmall
                  .copyWith(fontWeight: FontWeight.w700),
              unselectedLabelStyle: TextThemeProvider.bodyTextSmall,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.blackColor.withOpacity(0.3),
              controller: _tabController,
              tabs: _tablist),
          const Divider(),
          Expanded(
            child: SizedBox(
              child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  children: _tabViewList),
            ),
          ),
        ],
      ),
    );
  }
}
