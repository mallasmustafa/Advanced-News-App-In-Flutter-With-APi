import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/components/newstile_loading.dart';
import 'package:news_app2/controller/news_controller.dart';
import 'package:news_app2/pages/articalPage/widgets/search_widget.dart';
import 'package:news_app2/pages/homePage/widgets/news_tile.dart';
import 'package:news_app2/pages/newsDetails/news_details.dart';
class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children:  [
             const SearchWidget(),
              const SizedBox(height: 20),
              Obx(() => newsController.isNewsForYouLoading.value
                  ? const Column(
                    children: [
                      NewsTileLoading(),
                      NewsTileLoading(),
                      NewsTileLoading(),
                      NewsTileLoading(),
                      NewsTileLoading(),
                    ],
                  )
                  :
              Column(
                  children: newsController.newsForYouList.map((element) {
                    return NewsTile(
                      title: element.title??"unKnown",
                      author: element.author??"unKnown",
                      imageUrl: element.urlToImage??"https://icon-library.com/images/null-icon/null-icon-3.jpg",
                      time: element.publishedAt??"unknown",
                      onTap: ()=> Get.to(NewsDetailPage(newsModel: element)),
                    );
                  }).toList()
              )

              )
            ],
          ),
        ),
      ),
    );
  }
}
