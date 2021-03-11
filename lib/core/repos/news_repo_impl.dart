import 'package:get/get.dart';
import 'package:getx_news_app/consts.dart';
import 'package:getx_news_app/core/models/news_response.dart';
import 'package:getx_news_app/core/repos/news_repo.dart';
import 'package:getx_news_app/service/http_service.dart';
import 'package:getx_news_app/service/http_service_implementation.dart';
import '../models/article.dart';

class NewsRepoImpl implements NewsRepo {
  HttpService _httpService;
  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }
  @override
  Future<List<Article>> getNewsHeadline() async {
    print('start');
    try {
      final response = await _httpService.getRequest(US_TOP_HEADLINES);
      final parsedResponse = NewsResponse.fromJson(response.data);
      print(parsedResponse);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String q) async {
    try {
      final response = await _httpService.getRequest(SEARCH_QUERY + q);
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
