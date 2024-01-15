import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:shows_flix/Components/episode_card_component.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage(
      {super.key,
      required this.episodeUrl,
      required this.title,
      required this.image});
  final String episodeUrl;
  final String title;
  final String image;

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  List<Map<String, dynamic>> episodesData = [];
  String description = "";

  late Player player = Player();
  late VideoController controller = VideoController(player);

  @override
  void initState() {
    MediaKit.ensureInitialized();
    super.initState();
    VidstreamScraper.episodesList(widget.episodeUrl).then((value) {
      episodesData = value;
      description = value[0]['description'];
      setState(() {});
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
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
            onPressed: () {
              (Navigator.pop(context));
              player.dispose();
            },
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 120,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 100,
                          child:
                              SingleChildScrollView(child: Text(description)))
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 800,
                  height: 600,
                  child: Video(
                    controller: controller,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: episodesData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EpisodeCardComponent.episodeCard(
                          episodesData[index]['title'],
                          episodesData[index]["image"],
                          episodesData[index]["release_date"],
                          episodesData[index]['link'],
                          context,
                          player);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
