import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: AppColors.whiteColor,
    fontSize: 16.0);
