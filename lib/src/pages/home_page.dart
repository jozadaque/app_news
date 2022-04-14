import 'package:app_news/src/datasources/client_dio.dart';
import 'package:app_news/src/stories/news_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsStories newsStories = NewsStories(ClientDio());

  @override
  void initState() {
    super.initState();
    newsStories.getNews();
    newsStories.addListener(listeners);
  }

  void listeners() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    newsStories.removeListener(listeners);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'News 24',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ItemMenuTop(
                    title: "Top",
                    contentColor: Colors.black,
                    textColor: Colors.white,
                  ),
                  ItemMenuTop(title: 'World'),
                  ItemMenuTop(title: 'Politic'),
                  ItemMenuTop(title: 'Entertainment')
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.83,
              child: ListView.builder(
                itemCount: newsStories.news.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.parse(
                                      newsStories.news[index].picWidth) *
                                  0.65,
                              height: double.parse(
                                  newsStories.news[index].picHeight),
                              child: Image.network(
                                'https://www.vagalume.com.br${newsStories.news[index].picSrc}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.46,
                                    child: Text(
                                      newsStories.news[index].featured,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      newsStories.news[index].headline,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                      Container(
                        color: Colors.black12,
                        height: 1,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMenuTop extends StatelessWidget {
  const ItemMenuTop({
    Key? key,
    required this.title,
    this.textColor = Colors.black38,
    this.contentColor = Colors.black12,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: contentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
