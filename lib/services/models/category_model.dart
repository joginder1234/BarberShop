import 'dart:math';

import 'package:barbershop/config.dart';
import 'package:barbershop/services/stylesheet/icons.dart';

class CategoryModel {
  String title, image;
  CategoryModel(this.title, this.image);
}

class ChairClass {
  String image, name, chairNo, status;
  double ratings;
  int quePending;
  ChairClass(this.image, this.name, this.chairNo, this.quePending, this.status,
      this.ratings);
}

List<CategoryModel> categoryList = [
  CategoryModel("Hair Cut", CategoryIcons.hairCutIcon),
  CategoryModel("Hair Cut + Head Massage", CategoryIcons.headMassageIcon),
  CategoryModel("Facial", CategoryIcons.facialIcon),
  CategoryModel("Beared Style", CategoryIcons.bearStyleIcon),
  CategoryModel("Face Massage", CategoryIcons.faceMassageIcon),
  CategoryModel("Hair Rebonding", CategoryIcons.hairReboundIcon),
  CategoryModel("Hair Color", CategoryIcons.hairColorIcon),
  CategoryModel("Body Grooming", CategoryIcons.bodyGroomingIcon),
  CategoryModel("Women Special", CategoryIcons.womenSpecialIcon),
];

List<ChairClass> chairs = [
  ChairClass(profile_image, "Esther Howard", "1", Random().nextInt(8),
      "Available", 3.9),
  ChairClass(
      profile_image, "Devon Lane", "2", Random().nextInt(8), "Available", 4.2),
  ChairClass(
      profile_image, "Jerome Bell", "3", Random().nextInt(8), "Available", 4.0),
  ChairClass(profile_image, "Wade Warren", "4", Random().nextInt(8),
      "Unavailable", 3.0),
  ChairClass(
      profile_image, "Devon Lane", "5", Random().nextInt(8), "Available", 3.5),
  ChairClass(
      profile_image, "Esther Howard", "6", Random().nextInt(8), "Break", 3.9),
];
