import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Column(),
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
