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

  bool recentlyAddedSubsLoaded = false;
  bool recentlyRawsLoaded = false;
  bool recentlyAddedMoviesLoaded = false;
  bool onGoingShowsLoaded = false;
  bool popularShowsLoaded = false;

  @override
  void initState() {
    VidstreamScraper.recentlyAdded().then((value) {
      recentlyAddedSubs = value;
      setState(() {
        recentlyAddedSubsLoaded = true;
      });
    });
    VidstreamScraper.recentlyAddedRaw().then((value) {
      recentlyAddedRaws = value;
      setState(() {
        recentlyRawsLoaded = true;
      });
    });
    VidstreamScraper.recentlyAddedMovies().then((value) {
      recentlyAddedMovies = value;
      setState(() {
        recentlyAddedMoviesLoaded = true;
      });
    });
    VidstreamScraper.ongoingShows().then((value) {
      ongoingShows = value;
      setState(() {
        onGoingShowsLoaded = true;
      });
    });
    VidstreamScraper.popularShows().then((value) {
      popularShows = value;
      setState(() {
        popularShowsLoaded = true;
      });
    });
    super.initState();
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
      (recentlyAddedSubsLoaded)
          ? HomePageWidgets.homePageGrid(recentlyAddedSubs, context)
          : const Center(child: CircularProgressIndicator()),
      // Raw Section
      const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Recently Updated Raws",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      (recentlyRawsLoaded)
          ? HomePageWidgets.homePageGrid(recentlyAddedRaws, context)
          : const Center(child: CircularProgressIndicator()),
      // Movies Section
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Recently Updated Movies",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      (recentlyAddedMoviesLoaded)
          ? HomePageWidgets.homePageGrid(recentlyAddedMovies, context)
          : const Center(child: CircularProgressIndicator()),
      // Popular Section
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Popular TV Shows",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      (popularShowsLoaded)
          ? HomePageWidgets.homePageGrid(popularShows, context)
          : const Center(child: CircularProgressIndicator()),
      // Ongoing Section
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Ongoing Shows",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      (popularShowsLoaded)
          ? HomePageWidgets.homePageGrid(ongoingShows, context)
          : const Center(child: CircularProgressIndicator()),
    ]);
  }
}
