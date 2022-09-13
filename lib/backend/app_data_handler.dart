import 'package:flutter/cupertino.dart';

class AppDataProvider extends ChangeNotifier {
  /* Registeration User role handler section */
  dynamic _selectedRole;
  dynamic get getSelectedrole => _selectedRole;
  setUserRole(int role) {
    _selectedRole = role;
    notifyListeners();
  }

  String getUserRole() {
    switch (_selectedRole) {
      case 0:
        return "Salon";
      case 1:
        return "Customer";
      default:
        return "Barber";
    }
  }

  String getRegisterFormHeader() {
    switch (_selectedRole) {
      case 0:
        return "Register Salon";
      case 1:
        return "Sign up";
      case 2:
        return "Register as a Barber";
      default:
        return "";
    }
  }
}
