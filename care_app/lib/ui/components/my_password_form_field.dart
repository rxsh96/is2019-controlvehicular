import 'package:flutter/material.dart';

class MyPassFormField extends StatefulWidget {
  const MyPassFormField(
      {this.controller,
        this.textInputType,
        this.label,
        this.hint,
        this.icon,
        this.errorMsg,
        this.isLogin});

  final TextEditingController controller;
  final TextInputType textInputType;
  final String label;
  final String hint;
  final IconData icon;
  final String errorMsg;
  final bool isLogin;

  @override
  _MyPassFormFieldState createState() => _MyPassFormFieldState(
      controller: controller,
      textInputType: textInputType,
      label: label,
      hint: hint,
      icon: icon,
      errorMsg: errorMsg,
      isLogin: isLogin);
}

class _MyPassFormFieldState extends State<MyPassFormField> {

  _MyPassFormFieldState(
      {this.controller,
        this.textInputType,
        this.label,
        this.hint,
        this.icon,
        this.errorMsg,
        this.isLogin});

  TextEditingController controller;
  TextInputType textInputType;
  String label;
  String hint;
  IconData icon;
  String errorMsg;
  bool isLogin;

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      keyboardType: textInputType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: label,
        hintText: hint,
        suffixIcon: isLogin
            ? Icon(icon)
            : GestureDetector(
          onTap: _toggle,
          child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return errorMsg;
        }
        if (!isLogin && value.length < 5) {
          return 'La contraseña debe tener mínimo 5 caracteres';
        }
        return null;
      },
    );
  }
}
