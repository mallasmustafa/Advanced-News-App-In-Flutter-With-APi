import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/theme_controller.dart';
import 'home_page_controller.dart'; // Import your ThemeController

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: const HomePageController(),
      theme: lightTheme, // Set a default theme
      darkTheme: darkTheme, // Set a default dark theme
     // themeMode: ThemeMode.system, // Use the system theme by default
      builder: (context, child) {
        return GetBuilder<ThemeController>(
          init: ThemeController(), // Initialize ThemeController
          builder: (themeController) {
            return Theme(
              data: themeController.isLightMode.value ? lightTheme : darkTheme,
              child: child!,
            );
          },
        );
      },
    );
  }
}

