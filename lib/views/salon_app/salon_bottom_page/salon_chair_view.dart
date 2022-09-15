import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SalonAppChairView extends StatefulWidget {
  const SalonAppChairView({super.key});

  @override
  State<SalonAppChairView> createState() => _SalonAppChairViewState();
}

class _SalonAppChairViewState extends State<SalonAppChairView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Chairs", elevation: 0),
    );
  }
}
