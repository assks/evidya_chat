import 'package:evidya/constants/string_constant.dart';

class Validator {
   bool validateEmail(String value) {
    RegExp regExp = RegExp(StringConstant.valid_email);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool passwordStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validatePassword(String value) {
    if (value.length == 0) {
      return false;
    } else if (value.length < 4) {
      return false;
    } else {
      return true;
    }
  }

}
