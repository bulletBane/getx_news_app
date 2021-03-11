import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/widget/drawer.dart';
import 'package:getx_news_app/feature/news_search/controller/search_news_contoller.dart';

class SearchNewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller.searchTextEditingContoller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(fillColor: Colors.white, filled: true),
        ),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.articles != null
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                        itemBuilder: (context, i) => Column(
                              children: [
                                controller.articles[i].urlToImage != null
                                    ? Image.network(
                                        controller.articles[i].urlToImage)
                                    : Container(),
                                Text(
                                  controller.articles[i].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.articles[i].title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                        separatorBuilder: (context, i) => Divider(),
                        itemCount: controller.articles.length),
                  )
                : Center(
                    child: Text('NO ARTICLES'),
                  );
      }),
    );
  }
}
