import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/config.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/helpers/toast.dart';
import 'package:barbershop/services/models/user_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/news/news_view/customer_new_view_foryou.dart';
import 'package:barbershop/views/customer_app/news/news_view/customer_new_view_tutorial.dart';
import 'package:barbershop/views/customer_app/news/news_view/customer_news_view_hairtips.dart';
import 'package:barbershop/views/customer_app/news/news_view/customer_news_view_tranding.dart';
import 'package:barbershop/views/customer_app/news/salon_upload_content.dart';
import 'package:barbershop/views/customer_app/news/upload_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerAppNewsView extends StatefulWidget {
  const CustomerAppNewsView({Key? key}) : super(key: key);

  @override
  State<CustomerAppNewsView> createState() => _CustomerAppNewsViewState();
}

class _CustomerAppNewsViewState extends State<CustomerAppNewsView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _tabList = [
    const Tab(
      text: "For You",
    ),
    const Tab(
      text: "Trending",
    ),
    const Tab(
      text: "Tutorials",
    ),
    const Tab(
      text: "Hair Tips",
    ),
  ];

  final List<Widget> _tabViewList = [
    const CustomerNewsViewForYou(),
    const CustomerNewsViewTranding(),
    const CustomerNewsViewTutorial(),
    const CustomerNewsViewHairTips(),
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
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                            flex: 4,
                            child: SizedBox(
                              child: Center(
                                child: Text("Community News",
                                    style: TextThemeProvider.heading1),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  AppDataProvider().getSelectedrole();

                                  // pushTo(context,
                                  //     const CustomerAppUploadNewContent());
                                },
                                icon: SvgPicture.asset(
                                  OutlinedAppIcons.uploadIcon,
                                  color: AppColors.activeButtonColor,
                                ),
                              ),
                            ))
                      ],
                    ),
                    TabBar(
                        labelStyle: TextThemeProvider.bodyTextSmall
                            .copyWith(fontWeight: FontWeight.w700),
                        unselectedLabelStyle: TextThemeProvider.bodyTextSmall,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: AppColors.primaryColor,
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor:
                            AppColors.blackColor.withOpacity(0.3),
                        controller: _tabController,
                        tabs: _tabList),
                    const Divider(),
                    Expanded(
                      child: SizedBox(
                        child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            controller: _tabController,
                            children: _tabViewList),
                      ),
                    )
                  ],
                ))));
  }

  getRoute(String role) {
    switch (role) {
      case "customer":
        return pushTo(context, const CustomerAppUploadNewContent());
      case "salon":
        return pushTo(context, const SalonAppUploadNewContent());
      case "barber":
        return showToast("Comming Soon");
      default:
        return null;
    }
  }
}
