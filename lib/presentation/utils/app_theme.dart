import 'package:flutter/material.dart';
import 'package:my_gallery_task/presentation/utils/app_color.dart';

abstract class AppTheme {
  static const titleLoginScreen = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
      fontFamily: 'MyCustomFont');
  static const buttonsTexts = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColor.textColor,
      fontFamily: 'MyCustomFont');
  static const buttonsDialogTexts = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
      fontFamily: 'MyCustomFont');
}
