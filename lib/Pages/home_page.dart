import 'package:flutter/material.dart';
import 'package:shows_flix/Components/home_page_widgets.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Map<String, dynamic>> recentlyAddedSubs = [];
  List<Map<String, dynamic>> recentlyAddedRaws = [];
  List<Map<String, dynamic>> recentlyAddedMovies = [];
  List<Map<String, dynamic>> popularShows = [];
  List<Map<String, dynamic>> ongoingShows = [];

  @override
  void initState() {
    super.initState();
    VidstreamScraper.recentlyAdded().then((value) {
      recentlyAddedSubs = value;

      VidstreamScraper.recentlyAddedRaw().then((value_2) {
        recentlyAddedRaws = value_2;

        VidstreamScraper.recentlyAddedMovies().then((value_3) {
          recentlyAddedMovies = value_3;

          VidstreamScraper.popularShows().then((value_4) {
            popularShows = value_4;
            VidstreamScraper.ongoingShows().then((value_5) {
              ongoingShows = value_5;
              setState(() {});
            });
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Recently Updated Subs",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      HomePageWidgets.homePageGrid(recentlyAddedSubs, context),
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Recently Updated Raws",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      HomePageWidgets.homePageGrid(recentlyAddedRaws, context),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Recently Updated Movies",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      HomePageWidgets.homePageGrid(recentlyAddedMovies, context),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Popular TV Shows",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      HomePageWidgets.homePageGrid(popularShows, context),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Ongoing Shows",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      HomePageWidgets.homePageGrid(ongoingShows, context),
    ]);
  }
}
