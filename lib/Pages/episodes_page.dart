import 'package:flutter/material.dart';
import 'package:shows_flix/Components/episode_card_component.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key, required this.episodeUrl});
  final String episodeUrl;

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  List<Map<String, dynamic>> episodesData = [];
  @override
  void initState() {
    super.initState();
    VidstreamScraper.episodesList(widget.episodeUrl).then((value) {
      episodesData = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ShowsFlix"),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => (Navigator.pop(context)),
          ),
        ),
        body: ListView.builder(
            itemCount: episodesData.length,
            itemBuilder: (BuildContext context, int index) {
              return EpisodeCardComponent.episodeCard(
                  episodesData[index]['title'],
                  episodesData[index]["image"],
                  episodesData[index]["release_date"],
                  episodesData[index]['link'],
                  context);
            }),
      ),
    );
  }
}
