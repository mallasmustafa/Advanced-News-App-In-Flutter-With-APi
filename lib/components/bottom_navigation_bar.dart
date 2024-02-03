import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/controller/bottom_navigation_controller.dart';
import 'package:news_app2/pages/articalPage/artical_page.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController bottomNavController = Get.put(BottomNavController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 60,
          width: MediaQuery.of(context).size.width*0.5,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  bottomNavController.index.value = 0;
                },
                child: Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: bottomNavController.index.value == 0
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: bottomNavController.index.value == 0
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  bottomNavController.index.value = 1;
                  //Get.to(ArticalPage());
                },
                child: Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: bottomNavController.index.value == 1
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.book,
                        size: 25,
                        color: bottomNavController.index.value == 1
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  bottomNavController.index.value = 2;
                },
                child: Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: bottomNavController.index.value == 2
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Icon(Icons.settings,
                          size: 25,
                          color: bottomNavController.index.value == 2
                              ? Theme.of(context).colorScheme.onBackground
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
