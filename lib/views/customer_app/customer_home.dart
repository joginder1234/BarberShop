import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/image_provider.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/helper_widgets/offer_tile.dart';
import 'package:barbershop/views/customer_app/helper_widgets/salon_tile.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text.rich(TextSpan(
                      text: "Hello,",
                      style: TextThemeProvider.heading3.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: "Jhon Doe",
                            style: TextThemeProvider.heading3.copyWith(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w700))
                      ])),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 13, color: AppColors.primaryColor),
                      addWidth(7),
                      const Expanded(
                          child: SizedBox(
                        child: Text("Marconi Street, Kern County, CA-93504"),
                      ))
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          AppImageProvider.qrCodeIcon,
                          height: 20,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            OutlinedAppIcons.notificationIcon,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      child: CustomTextFieldView(
                        hint: "Search for salons or location...",
                        suffixIcon: OutlinedAppIcons.searchIcon,
                      ),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          OutlinedAppIcons.filterIcon,
                          color: AppColors.primaryColor,
                        )),
                  ],
                ),
                addHeight(10),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      addHeight(10),
                      AddPageSection(
                        title: "Categories",
                        btnTitle: "view all",
                        ontap: () {},
                      ),
                      addHeight(13),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categoryList
                              .map((e) => Container(
                                    padding: const EdgeInsets.all(6),
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.cardColor),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(e.image, width: 45),
                                        SizedBox(
                                          height: 35,
                                          child: Center(
                                            child: Text(e.title,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextThemeProvider
                                                    .bodyTextSmall),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      addHeight(30),
                      AddPageSection(
                        title: "Package and offers",
                        btnTitle: "view all",
                        ontap: () {},
                      ),
                      addHeight(10),
                      SizedBox(
                        width: getWidth(context),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                4, (index) => const CustomerAppOfferTile()),
                          ),
                        ),
                      ),
                      addHeight(30),
                      AddPageSection(
                        title: "Nearby Salons",
                        btnTitle: "view on map",
                        ontap: () {},
                      ),
                      addHeight(10),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, i) =>
                              const CustomerAppSalonTile())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class AddPageSection extends StatelessWidget {
  String title, btnTitle;
  Function? ontap;
  AddPageSection(
      {Key? key, required this.title, this.btnTitle = '', this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextThemeProvider.heading3),
        TextButton(
            onPressed: ontap == null ? null : () => ontap!(),
            child: Text(btnTitle, style: TextThemeProvider.bodyTextSecondary))
      ],
    );
  }
}
