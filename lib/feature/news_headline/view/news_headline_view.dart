import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/widget/drawer.dart';
import 'package:getx_news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  final controller = Get.find<NewsHeadlineController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Headline"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.articles[i].title,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: controller.articles.length),
              );
      }),
    );
  }
}
