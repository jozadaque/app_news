import 'package:app_news/src/datasources/client_dio.dart';
import 'package:app_news/src/stories/news_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Deve retornar uma lista de NewsModel',
    () async {
      NewsStories newsStories = NewsStories(ClientDio());
      await newsStories.getNews();
      expect(newsStories.news.isNotEmpty, true);
    },
  );
}
