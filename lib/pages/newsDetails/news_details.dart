import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app2/Model/NewsModel.dart';
import 'package:news_app2/controller/news_controller.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel newsModel;

  const NewsDetailPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(newsModel.publishedAt ?? "unKnown");
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new),
                            Text("Back"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  //height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            newsModel.urlToImage ??
                                "https://icon-library.com/images/null-icon/null-icon-3.jpg",
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  newsModel.title ?? "unKnown",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      dateTime != null
                          ? "${dateTime.day}/${dateTime.month}/${dateTime.year}"
                          : "Invalid Date",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        newsModel.author?[0] ?? "",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        newsModel.author ?? "unKnown",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                          Theme
                              .of(context)
                              .colorScheme
                              .secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                  child: Row(
                    children: [
                      Obx(() =>
                      newsController.isSpeeking.value
                          ? IconButton(
                          onPressed: () {
                            newsController.stop();
                          },
                          icon: Icon(Icons.stop, size: 50,))
                          : IconButton(
                          onPressed: () {
                            newsController.speak(
                                newsModel.description ?? "No Description");
                          },
                          icon: const Icon(
                            Icons.play_arrow_outlined,
                            size: 50,
                          ))),
                      Obx(() {
                        return Expanded(
                          child: Lottie.asset(
                            "assets/Animation/wave.json",
                            height: 70,
                            animate: newsController.isSpeeking.value,
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        newsModel.description ?? "No description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                          Theme
                              .of(context)
                              .colorScheme
                              .secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
