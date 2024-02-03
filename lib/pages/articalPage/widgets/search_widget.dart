import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app2/controller/news_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme
              .of(context)
              .colorScheme
              .primaryContainer
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Search News..",
                  fillColor: Theme
                      .of(context)
                      .colorScheme
                      .primaryContainer,
                  border: InputBorder.none
              ),
            ),
          ),
          Obx(() => newsController.isNewsForYouLoading.value?Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
             : InkWell(
              onTap: () {
                newsController.searchNews(searchController.text);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
                child: Icon(Icons.search),
              ),
             )
          ),
        ],
      ),
    );
  }
}
