import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/components/newstile_loading.dart';
import 'package:news_app2/components/tranding_loading_card.dart';
import 'package:news_app2/controller/news_controller.dart';
import 'package:news_app2/pages/homePage/widgets/news_tile.dart';
import 'package:news_app2/pages/homePage/widgets/tranding_card.dart';
import 'package:news_app2/pages/newsDetails/news_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.dashboard),
                  ),
                  const Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primaryContainer,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() =>
                newsController.isTrandingNewsLoading.value
                    ? const Row(children: [TrandingLoadingCard(), TrandingLoadingCard()],)
                    :
                Row(
                    children: newsController.trandingNewsList.map((element) {
                      return TrandingCard(
                        ontap: () {
                          Get.to(NewsDetailPage(newsModel: element));
                        },
                        title: element.title??"unKnown",
                        author: element.author ?? "unKnown",
                        imageUrl: element.urlToImage??"https://icon-library.com/images/null-icon/null-icon-3.jpg",
                        tag: "Tranding no 1",
                        time: element.publishedAt??"unKnown",
                      );
                    }).toList()
                ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() =>
              newsController.isNewsForYouLoading.value
                  ? const Column(
                children: [
                  NewsTileLoading(),
                  NewsTileLoading(),
                  NewsTileLoading(),
                ],
              )
                  :
              Column(
                  children: newsController.newsForYou5.map((element) {
                    return NewsTile(
                      onTap: () {
                        Get.to(NewsDetailPage(newsModel: element));
                      },
                      title: element.title ?? "unKnown",
                      author: element.author ?? "unKnown",
                      imageUrl:
                      element.urlToImage ??
                          "https://icon-library.com/images/null-icon/null-icon-3.jpg",
                      time: element.publishedAt ?? "unKwown",
                    );
                  }).toList()
              ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tesla News",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Obx(() =>
              newsController.isTeslaNewsLoading.value
                  ? const Column(
                children: [
                  NewsTileLoading(),
                  NewsTileLoading(),
                  NewsTileLoading(),
                ],
              )
                  :
              Column(
                  children: newsController.teslaNews5.map((element) {
                    return NewsTile(
                        onTap: () => Get.to(NewsDetailPage(newsModel: element)),
                        imageUrl: element.urlToImage ??
                            "https://icon-library.com/images/null-icon/null-icon-3.jpg",
                        title: element.title ?? "UnKnown",
                        author: element.author ?? "Unknown",
                        time: element.publishedAt ?? "unKnown");
                  }).toList()
              ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "AppleNews",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                      "See All",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelSmall
                  )
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() =>
                newsController.isAppleNewsLoading.value
                    ? Row(children: [TrandingLoadingCard(), TrandingLoadingCard(),],)
                    :
                Row(
                    children: newsController.appleNews5.map((element) {
                      return TrandingCard(
                          imageUrl: element.urlToImage ??
                              "https://icon-library.com/images/null-icon/null-icon-3.jpg",
                          tag: "Tranding no 2",
                          time: element.publishedAt ?? "unKnown",
                          title: element.title ?? "unKnown",
                          author: element.author ?? "unKnown",
                          ontap: () =>
                              Get.to(NewsDetailPage(newsModel: element)));
                    }).toList()
                ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  Text(
                    "See All",
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => newsController.isBusinessNewsLoading.value
                  ?const Column(
                children: [
                  NewsTileLoading(),
                  NewsTileLoading(),
                  NewsTileLoading(),
                ],
              )
                  :
              Column(
                  children: newsController.businessNews5.map((element) {
                    return NewsTile(
                      imageUrl: element.urlToImage ??
                          "https://icon-library.com/images/null-icon/null-icon-3.jpg",
                      title: element.title ?? "unKnown",
                      author: element.author ?? "unKnown",
                      time: element.publishedAt ?? "unKnown",
                      onTap: () => Get.to(NewsDetailPage(newsModel: element)),
                    );
                  }).toList()
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
