import 'package:get/get.dart';
import 'package:getx_news_app/feature/news_search/controller/search_news_contoller.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
