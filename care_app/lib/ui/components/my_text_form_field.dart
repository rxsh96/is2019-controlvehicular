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
        this.errorMsg,
      this.maxLines});

  final TextEditingController controller;
  final TextCapitalization capitalization;
  final TextInputType textInputType;
  final String label;
  final String hint;
  final IconData icon;
  final String errorMsg;
  final int maxLines;



  @override
  _MyTextFormFieldState createState() => _MyTextFormFieldState(
      controller: controller,
      capitalization: capitalization,
      textInputType: textInputType,
      label: label,
      hint: hint,
      icon: icon,
      errorMsg: errorMsg,
  maxLines: maxLines);
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  _MyTextFormFieldState(
      {this.controller,
        this.capitalization,
        this.textInputType,
        this.label,
        this.hint,
        this.icon,
        this.errorMsg,
      this.maxLines});

  TextEditingController controller;
  TextCapitalization capitalization;
  TextInputType textInputType;
  String label;
  String hint;
  IconData icon;
  String errorMsg;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      textCapitalization: capitalization,
      decoration: InputDecoration(
        border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: label,
        hintText: hint,
        suffixIcon: Icon(icon),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
      maxLines: maxLines,
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
        if (label == 'Placa') {
          if (!MyValidator().validatePlate(value)) {
            return 'Placa Inválida';
          }
        }
        return null;
      },
    );
  }
}
