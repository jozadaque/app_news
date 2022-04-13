import 'package:app_news/src/model/news_model.dart';
import 'package:app_news/src/repositories/inews.dart';
import 'package:flutter/widgets.dart';

class NewsStories extends ChangeNotifier {
  final INews newsRepository;
  List<NewsModel> news = [];

  String url = 'https://www.vagalume.com.br/news/index.js';
  NewsStories(this.newsRepository);

  Future<void> getNews() async {
    final list = await newsRepository.getNews(url);
    final neWs = list
        .map((news) => NewsModel(
              news['id'],
              news['headline'],
              news['kicker'],
              news['featured'],
              news['url'],
              news['inserted'],
              news['modified'],
              news['pic_src'],
              news['pic_width'],
              news['pic_height'],
            ))
        .toList();

    news = neWs;
    notifyListeners();
  }
}
