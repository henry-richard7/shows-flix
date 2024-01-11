import 'package:flutter/material.dart';
import 'package:shows_flix/Components/home_page_widgets.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    VidstreamScraper.recentlyAdded().then((value) => data = value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Recently Updated"),
      ),
      HomePageWidgets.homePageGrid(data),
    ]);
  }
}
