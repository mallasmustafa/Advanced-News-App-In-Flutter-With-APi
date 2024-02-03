import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/controller/theme_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "SETTINGS",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      themeController.isLightMode.value?"Dark Mode": "Light Mode",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                Obx(
                      () {
                    return CupertinoSwitch(
                      value: themeController.isLightMode.value,
                      onChanged: (value) => themeController.toggleTheme(),
                    );
                  },
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
