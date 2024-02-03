import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/config/colors.dart';

class ThemeController extends GetxController {
  var isLightMode = false.obs;

  void toggleTheme() {
    isLightMode.toggle(); // Assuming isDarkMode is an RxBool
    updateTheme();
  }


  void updateTheme() {
    Get.changeTheme(isLightMode.value ? lightTheme : darkTheme);
  }
}

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
      fillColor: lightBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: lightLabelColor,
      labelStyle: TextStyle(
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
          fontSize: 15,
          color: lightFontColor,
          fontWeight: FontWeight.w500
      )
  ),
  colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: lightBgColor,
      onBackground: lightFontColor,
      primaryContainer: lightDivColor,
      onPrimaryContainer: lightFontColor,
      secondaryContainer: lightLabelColor,
      primary: lightPrimaryColor
  ),
  textTheme: const TextTheme(
    headlineLarge:  TextStyle(
      fontSize: 24,
      color: lightFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium:  TextStyle(
      fontSize: 20,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall:  TextStyle(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge:  TextStyle(
      fontSize: 16,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium:  TextStyle(
      fontSize: 15,
      color: lightFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall:  TextStyle(
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall:  TextStyle(
      fontSize: 13,
      color: lightFontColor,
      fontWeight: FontWeight.w300,
    ),
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: darkLabelColor,
      labelStyle: TextStyle(
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
          fontSize: 15,
          color: darkFontColor,
          fontWeight: FontWeight.w500
      )
  ),
  colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      background: darkBgColor,
      onBackground: darkFontColor,
      primaryContainer: darkDivColor,
      onPrimaryContainer: darkFontColor,
      secondaryContainer: darkLabelColor,
      primary: darkPrimaryColor
  ),
  textTheme: const TextTheme(
    headlineLarge:  TextStyle(
      fontSize: 24,
      color: darkFontColor,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium:  TextStyle(
      fontSize: 20,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall:  TextStyle(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge:  TextStyle(
      fontSize: 16,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium:  TextStyle(
      fontSize: 15,
      color: darkFontColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall:  TextStyle(
      fontSize: 13,
      color: darkFontColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall:  TextStyle(
      fontSize: 13,
      color: darkLabelColor,
      fontWeight: FontWeight.w500,
    ),
  ),
);
