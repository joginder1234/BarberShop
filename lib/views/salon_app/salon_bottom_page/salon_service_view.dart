import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:flutter/material.dart';

class SalonAppServiceView extends StatefulWidget {
  const SalonAppServiceView({super.key});

  @override
  State<SalonAppServiceView> createState() => _SalonAppServiceViewState();
}

class _SalonAppServiceViewState extends State<SalonAppServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(title: "Edit Chair"),
    );
  }
}
