import 'package:email_validator/email_validator.dart';

class MyValidator{

  bool validateMobile(String value){
    String phoneNumberPattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp phoneNumberRegExp = new RegExp(phoneNumberPattern);
    return phoneNumberRegExp.hasMatch(value);
  }

  bool validateEmail(String value){
    return EmailValidator.validate(value);
  }

}