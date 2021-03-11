import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_news_app/core/models/article.dart';
import 'package:getx_news_app/core/repos/news_repo.dart';
import 'package:getx_news_app/core/repos/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsHeadline();
  }
  RxList<Article> articles;
  RxBool isLoading = false.obs;

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
    print('starttt');
    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      debugPrint('No Data recieved');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
