import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/components/bottom_navigation_bar.dart';
import 'package:news_app2/controller/bottom_navigation_controller.dart';
class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Scaffold(
      body: Obx(() => bottomNavController.pages[bottomNavController.index.value]),
      floatingActionButton: const BottomNavigationBarWidget(),
    );
  }
}
