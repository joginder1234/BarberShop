import 'package:barbershop/backend/app_data_handler.dart';
import 'package:barbershop/onboarding.dart';
import 'package:barbershop/services/helpers/help_functions.dart';
import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:barbershop/services/stylesheet/icons.dart';
import 'package:barbershop/services/stylesheet/text_theme.dart';
import 'package:barbershop/widgets/button_theme.dart';
import 'package:barbershop/widgets/custom_dropdown.dart';
import 'package:barbershop/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BarberDetailsView extends StatefulWidget {
  const BarberDetailsView({Key? key}) : super(key: key);

  @override
  State<BarberDetailsView> createState() => _BarberDetailsViewState();
}

class _BarberDetailsViewState extends State<BarberDetailsView> {
  final TextEditingController _imageCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<String> _categories = [
    "Select",
    "Hair Cut",
    "Spa",
    "Facial",
    "Beard Styling"
  ];
  String _selectedCategory = 'Select';
  XFile? _pickedfile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return GestureDetector(
      onTap: () => unfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: emptyAppBar(title: db.getRegisterFormHeader()),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Details", style: TextThemeProvider.heading1),
              Text("Tell us in which category you are perfect.",
                  style: TextThemeProvider.bodyTextSmall),
              addHeight(35),
              CustomDropdownButton(
                  label: "Category",
                  onChanged: (v) => setState(() => _selectedCategory = v),
                  value: _selectedCategory,
                  items: _categories),
              addHeight(24),
              CustomTextFieldView(
                controller: _imageCtrl,
                hint: "Upload",
                label: "Profile Image",
                readOnly: true,
                suffixIcon: OutlinedAppIcons.uploadIcon,
                ontap: () => pickFile(),
              ),
              const Expanded(child: SizedBox()),
              ExpandedButtonView(
                  title: "Next",
                  ontap: () => pushToandRemove(context, const OnBoardingView()))
            ],
          ),
        )),
      ),
    );
  }

  pickFile() async {
    var picked = await _picker.pickImage(source: ImageSource.gallery);
    picked != null
        ? setState(() {
            _pickedfile = picked;
            _imageCtrl.text = picked.path.split("/").last;
          })
        : null;
  }
}
