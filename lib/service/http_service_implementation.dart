import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:getx_news_app/consts.dart';
import 'package:getx_news_app/service/http_service.dart';

class HttpServiceImpl implements HttpService {
  Dio _dio = Dio();
  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initInterseptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e) {
        debugPrint(e.message);
      },
      onRequest: (options) {
        debugPrint('${options.method} | ${options.path}');
      },
      onResponse: (e) {
        debugPrint('${e.statusCode} ${e.statusMessage} ${e.data}');
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(
        BaseOptions(baseUrl: BASE_URL, headers: {"Authorization": "$API_KEY"}));
    initInterseptors();
  }
}
