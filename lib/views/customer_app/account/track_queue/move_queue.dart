import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/models/category_model.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

class CustomerMoveQueueView extends StatefulWidget {
  const CustomerMoveQueueView({Key? key}) : super(key: key);

  @override
  State<CustomerMoveQueueView> createState() => _CustomerMoveQueueViewState();
}

class _CustomerMoveQueueViewState extends State<CustomerMoveQueueView> {
  int selectedChair = 0;

  void selectChair(int chairNumber) =>
      setState(() => selectedChair = chairNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Select Another Specialist", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Tap one of the image to join the queue for your specialist",
                  textAlign: TextAlign.center,
                  style: TextThemeProvider.bodyText),
              addHeight(20),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chairs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, i) {
                    return CustomerAppChairTile(
                      chair: chairs[i],
                      isSelected: selectedChair.toString() == chairs[i].chairNo,
                      ontap: () => selectChair(int.parse(chairs[i].chairNo)),
                    );
                  })
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ExpandedButtonView(
            isDisabled: selectedChair == 0,
            title: "Confirm Queue for #$selectedChair",
            ontap: () {}),
      ),
    );
  }
}

class CustomerAppChairTile extends StatelessWidget {
  ChairClass chair;
  bool isSelected;
  Function? ontap;
  CustomerAppChairTile(
      {Key? key, required this.chair, this.ontap, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeTextColor = AppColors.whiteColor;
    Color inactiveTextColor = AppColors.blackColor;

    return InkWell(
      onTap: () => ontap!(),
      child: Card(
        color: isSelected ? AppColors.activeButtonColor : activeTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(chair.image), fit: BoxFit.cover),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(7))),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 7,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: getStatusColor(chair.status),
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(20))),
                        child: Text(
                          chair.status,
                          style: TextThemeProvider.helperText
                              .copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 3,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  AppColors.activeButtonColor.withOpacity(0.6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(chair.ratings.toString(),
                                  style: TextThemeProvider.helperText
                                      .copyWith(color: AppColors.whiteColor)),
                              const Icon(
                                Icons.star,
                                color: AppColors.statusPendingColor,
                                size: 10,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.activeButtonColor
                          : AppColors.whiteColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(7))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [Expanded(child: SizedBox())],
                      ),
                      Text(chair.name,
                          style: TextThemeProvider.bodyTextSecondary.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isSelected
                                  ? activeTextColor
                                  : inactiveTextColor)),
                      Text("Chair no. ${chair.chairNo}",
                          style: TextThemeProvider.bodyTextSecondary.copyWith(
                              color: isSelected
                                  ? activeTextColor
                                  : inactiveTextColor.withOpacity(0.5))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${chair.quePending} in queue",
                              style: TextThemeProvider.bodyTextSecondary
                                  .copyWith(
                                      color: isSelected
                                          ? activeTextColor
                                          : inactiveTextColor))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    double opacity = 0.5;
    switch (status) {
      case "Available":
        return AppColors.statusGoodColor.withOpacity(opacity);
      case "Unavailable":
        return AppColors.statusErrorColor.withOpacity(opacity);
      case "Break":
        return AppColors.statusPendingColor.withOpacity(opacity);
      default:
        return AppColors.activeButtonColor;
    }
  }
}
