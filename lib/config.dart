import 'package:barbershop/services/models/user_model.dart';

const String appName = "BarberShop Waitroll";
const String appLogo = "assets/images/logo.png";
const int maxImagesOnSalonRegister = 9;

/* These values needs to be removed before App Publication */
const String salon_image =
    "https://s3.us-east-2.amazonaws.com/referrizer-images/offer/12c1ddcfbcfc8d9668c7b3142fe7f965.png";
const String profile_image =
    "https://docs.microsoft.com/en-us/answers/storage/attachments/209536-360-f-364211147-1qglvxv1tcq0ohz3fawufrtonzz8nq3e.jpg";

const salonDescription =
    "Viverra eleifend imperdiet vitae turpis senectus tincidunt. Ultrices porttitor nunc lorem lacinia massa sapien tincidunt duis risus. Pellentesque dolor, ultrices lectus at neque amet sed sed. Egestas tincidunt sed lacus consectetur interdum integer. Pellentesque amet sed facilisis non. Rhoncus ullamcorper mi, vitae amet, lacus sit maecenas facilisis. Nec ac sit ut donec suspendisse convallis sit.";

List<UserModel> testUsers = [
  UserModel(
      "customer@gmail.com", "9991111111", 'customer', "password", "123456"),
  UserModel("salon@gmail.com", "9992222222", 'salon', "password", "123456"),
  UserModel("barber@gmail.com", "9993333333", 'barber', "password", "123456"),
];
