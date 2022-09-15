import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CustomerAppSelectPersonsDialog extends StatefulWidget {
  const CustomerAppSelectPersonsDialog({super.key});

  @override
  State<CustomerAppSelectPersonsDialog> createState() =>
      _CustomerAppSelectPersonsDialogState();
}

class _CustomerAppSelectPersonsDialogState
    extends State<CustomerAppSelectPersonsDialog> {
  final List<String> _btnList = ["One", "Two", "Three"];
  String activeBtn = 'One';
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      children: [
        SizedBox(width: getWidth(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Center(
                    child: Text("Select Child for Queue",
                        style: TextThemeProvider.heading3),
                  ),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                    child: IconButton(
                        onPressed: () => popView(context),
                        icon: const Icon(Icons.close)))),
          ],
        ),
        Center(
          child: Text("Maximum 3 slots can be queued at one time.",
              style: TextThemeProvider.bodyTextSmall),
        ),
        addHeight(15),
        Row(
          children: _btnList
              .map((e) => Expanded(
                      child: GestureDetector(
                    onTap: () => setState(() => activeBtn = e),
                    child: SizedBox(
                      child: ExpandedButtonView(
                          title: e, isDisabled: activeBtn != e, ontap: () {}),
                    ),
                  )))
              .toList(),
        ),
        activeBtn == "One"
            ? const SizedBox()
            : Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addHeight(30),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              child: CustomTextFieldView(
                                readOnly: true,
                                hint: "Slot 2",
                                label: "Child",
                              ),
                            )),
                        addWidth(10),
                        Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: CustomTextFieldView(
                                hint: "xx yrs",
                                label: "Age",
                              ),
                            )),
                      ],
                    ),
                    addHeight(15),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              child: CustomTextFieldView(
                                isDisabled: activeBtn != "Three",
                                hint: "Slot 3",
                                label: "Child",
                              ),
                            )),
                        addWidth(10),
                        Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: CustomTextFieldView(
                                isDisabled: activeBtn != "Three",
                                hint: "xx yrs",
                                label: "Age",
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
        addHeight(20),
        ExpandedButtonView(
            title: "Confirm",
            ontap: () {
              popView(context);
            })
      ],
    );
  }
}
