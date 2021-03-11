import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/models/article.dart';
import 'package:getx_news_app/core/repos/news_repo.dart';
import 'package:getx_news_app/core/repos/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Article> articles;
  NewsRepo _newsRepo;
  final searchTextEditingContoller = TextEditingController();

  SearchNewsController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    searchTextEditingContoller.addListener(() {
      if (!(searchTextEditingContoller.text.length < 4)) {
        Future.delayed(Duration(milliseconds: 500),
            getArticles(searchTextEditingContoller.text));
      }
    });
  }

  getArticles(String query) async {
    isLoading.toggle();
    final result = await _newsRepo.getSearchedNews(query);
    isLoading.toggle();
    if (result != null) {
      articles = result.obs;
    } else
      debugPrint('NULLLL');
  }
}
