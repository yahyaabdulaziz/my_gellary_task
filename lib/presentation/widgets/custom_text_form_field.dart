import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;

  bool isPassword;

  TextEditingController controller;

  String? Function(String?)? validator;
  TextInputType type;

  CustomTextFormField({
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall,
      ),
      style:
          Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
      controller: controller,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
      maxLines: 1,
    );
  }
}
