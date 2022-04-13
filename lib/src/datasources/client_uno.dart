import 'package:app_news/src/repositories/inews.dart';
import 'package:uno/uno.dart';

class ClientUno extends INews {
  Uno uno = Uno();

  @override
  Future<List> getNews(String url) async {
    final response = await uno.get(url);
    final list = response.data as Map;
    return list['news'];
  }
}
