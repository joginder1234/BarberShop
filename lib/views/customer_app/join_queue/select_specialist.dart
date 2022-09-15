import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/views/customer_app/account/track_queue/track_my_queue.dart';
import 'package:barbershop/views/customer_app/join_queue/select_persons_card.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:flutter/material.dart';

import '../../../services/models/category_model.dart';
import '../account/track_queue/move_queue.dart';

class CustomerAppSelectSpecialistView extends StatefulWidget {
  const CustomerAppSelectSpecialistView({super.key});

  @override
  State<CustomerAppSelectSpecialistView> createState() =>
      _CustomerAppSelectSpecialistViewState();
}

class _CustomerAppSelectSpecialistViewState
    extends State<CustomerAppSelectSpecialistView> {
  int selectedChair = 0;

  void selectChair(int chairNumber) =>
      setState(() => selectedChair = chairNumber);

  @override
  Widget build(BuildContext context) {
    bool showAvailablility = selectedChair != 0;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Select Specialist", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                  "Tap one of the image to join the queue with your specialist",
                  textAlign: TextAlign.center,
                  style: TextThemeProvider.bodyTextSmall),
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
                  }),
              addHeight(30),
              !showAvailablility
                  ? const SizedBox()
                  : Card(
                      child: Container(
                        width: getWidth(context),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text("Devon Lane",
                                style: TextThemeProvider.bodyText
                                    .copyWith(fontWeight: FontWeight.w700)),
                            Text("chair no. $selectedChair",
                                style: TextThemeProvider.bodyTextSecondary
                                    .copyWith(
                                        color: AppColors.blackLightColor)),
                            addHeight(20),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: ExpandedButtonView(
                                        title: "In Queue 02",
                                        ontap: () {},
                                        isDisabled: true,
                                        titleColor:
                                            AppColors.activeButtonColor),
                                  ),
                                ),
                                addWidth(10),
                                Expanded(
                                  child: SizedBox(
                                    child: ExpandedButtonView(
                                        title: "Available",
                                        ontap: () {},
                                        isDisabled: true,
                                        titleColor:
                                            AppColors.activeButtonColor),
                                  ),
                                )
                              ],
                            ),
                            addHeight(20),
                            Text("Service Time",
                                style: TextThemeProvider.bodyText
                                    .copyWith(fontWeight: FontWeight.w700)),
                            addHeight(5),
                            Row(
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: ExpandedButtonView(
                                          title: "45 minutes",
                                          ontap: () {},
                                          isDisabled: true,
                                          titleColor:
                                              AppColors.activeButtonColor),
                                    )),
                                const Expanded(flex: 1, child: SizedBox()),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
              addHeight(30),
              ExpandedButtonView(
                  title: "Select Persons",
                  ontap: () => showDialog(
                      context: context,
                      builder: (context) => StatefulBuilder(
                          builder: (context, setState) =>
                              const CustomerAppSelectPersonsDialog())),
                  isDisabled: selectedChair == 0,
                  btnColor: AppColors.blackfaddedColor,
                  titleColor: AppColors.activeButtonColor),
              addHeight(10),
              ExpandedButtonView(
                title:
                    "Confirm Queue for ${showAvailablility ? '#$selectedChair' : ''}",
                ontap: () =>
                    pushTo(context, CustomerTrackQueue(isNewBooking: true)),
                isDisabled: selectedChair == 0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
