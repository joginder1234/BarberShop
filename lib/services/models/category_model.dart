import 'package:barbershop/services/stylesheet/icons.dart';

class CategoryModel {
  String title, image;
  CategoryModel(this.title, this.image);
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
