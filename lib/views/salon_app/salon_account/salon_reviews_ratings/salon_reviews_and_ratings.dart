import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_reviews_ratings/salon_new_reviews.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_reviews_ratings/salon_positive_reviews.dart';
import 'package:barbershop/views/salon_app/salon_account/salon_reviews_ratings/salon_worst_reviews.dart';
import 'package:flutter/material.dart';

class SalonReviewsAndRatings extends StatefulWidget {
  const SalonReviewsAndRatings({super.key});

  @override
  State<SalonReviewsAndRatings> createState() => _SalonReviewsAndRatingsState();
}

class _SalonReviewsAndRatingsState extends State<SalonReviewsAndRatings>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _tablist = [
    const Tab(
      text: "New",
    ),
    const Tab(
      text: "Positive",
    ),
    const Tab(
      text: "Worst",
    ),
  ];

  final List<Widget> _tabViewList = [
    const SalonNewReviews(),
    const SalonPositiveReviews(),
    const SalonWorstReviews(),
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
      appBar: emptyAppBar(title: "Reviews and Ratings", elevation: 0),
      body: SafeArea(
        child: Column(
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
      ),
    );
  }
}
