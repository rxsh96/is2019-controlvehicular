import 'package:flutter/material.dart';

import 'package:care_app/core/extras/validator.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {this.controller,
        this.capitalization,
        this.textInputType,
        this.label,
        this.hint,
        this.icon,
        this.errorMsg});

  final TextEditingController controller;
  final TextCapitalization capitalization;
  final TextInputType textInputType;
  final String label;
  final String hint;
  final IconData icon;
  final String errorMsg;



  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState(
      controller: controller,
      capitalization: capitalization,
      textInputType: textInputType,
      label: label,
      hint: hint,
      icon: icon,
      errorMsg: errorMsg);
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  _MyTextFormFieldState(
      {this.controller,
        this.capitalization,
        this.textInputType,
        this.label,
        this.hint,
        this.icon,
        this.errorMsg});

  TextEditingController controller;
  TextCapitalization capitalization;
  TextInputType textInputType;
  String label;
  String hint;
  IconData icon;
  String errorMsg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      keyboardType: textInputType,
      textCapitalization: capitalization,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: Icon(icon),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return errorMsg;
        }
        if (textInputType == TextInputType.emailAddress) {
          if (!MyValidator().validateEmail(value)) {
            return 'Correo Inválido';
          }
        }
        if (textInputType == TextInputType.phone) {
          if (!MyValidator().validateMobile(value)) {
            return 'Número de Teléfono Inválido';
          }
        }
        return null;
      },
    );
  }
}
