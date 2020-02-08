class MyValidator{

  bool validateMobile(String value){
    const String phoneNumberPattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final RegExp phoneNumberRegExp = RegExp(phoneNumberPattern);
    return phoneNumberRegExp.hasMatch(value);
  }

  bool validateEmail(String value){
    const String emailAddressPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp emailAddressRegExp = RegExp(emailAddressPattern);
    return emailAddressRegExp.hasMatch(value);
  }
  

  bool validatePlate(String value){
    const String platePattern = r'^[A-Z]{3}-[1-9]{3,4}$';
    final RegExp plateRegExp = RegExp(platePattern);
    return plateRegExp.hasMatch(value);
  }

}