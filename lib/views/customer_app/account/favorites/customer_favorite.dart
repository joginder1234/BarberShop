import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/views/customer_app/helper_widgets/salon_tile.dart';
import 'package:flutter/material.dart';

class CustomerFavoriteView extends StatefulWidget {
  const CustomerFavoriteView({Key? key}) : super(key: key);

  @override
  State<CustomerFavoriteView> createState() => _CustomerFavoriteViewState();
}

class _CustomerFavoriteViewState extends State<CustomerFavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: emptyAppBar(title: "Favorites", elevation: 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: List.generate(3, (index) => const CustomerAppSalonTile()),
          ),
        ),
      )),
    );
  }
}
