import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppDataProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingView(),
      ),
    );
  }
}
