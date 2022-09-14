import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:flutter/material.dart';

class SalonTile extends StatelessWidget {
  const SalonTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: const Text("1"),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Jhon Doe"),
                      Text("2:00PM, Barber Name"),
                      Text("Confirmed"),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("2 Km"),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.activeButtonColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        onPressed: () {},
                        child: const Text("Skip"),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
