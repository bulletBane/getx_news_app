import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/feature/news_headline/bin/news_headline_binding.dart';
import 'package:getx_news_app/feature/news_headline/view/news_headline_view.dart';
import 'package:getx_news_app/feature/news_search/bin/search_news_binding.dart';
import 'package:getx_news_app/feature/news_search/view/news_search_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/news_headline',
      getPages: [
        GetPage(
            name: '/news_headline',
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: '/search_news',
            page: () => SearchNewsView(),
            binding: SearchNewsBinding())
      ],
    );
  }
}
