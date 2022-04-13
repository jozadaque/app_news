import 'package:app_news/src/repositories/inews.dart';
import 'package:dio/dio.dart';

class ClientDio extends INews {
  Dio dio = Dio();

  @override
  Future<List<dynamic>> getNews(String url) async {
    final response = await dio.get(url);
    final list = response.data as Map;
    return list['news'];
  }
}
