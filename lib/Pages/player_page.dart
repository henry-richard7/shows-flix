import 'package:flutter/material.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.finalUrl});
  final String finalUrl;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  Map<String, dynamic> directLink = {};
  @override
  void initState() {
    super.initState();
    VidstreamScraper.directLinks(widget.finalUrl).then((value) {
      directLink = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: const Text("ShowsFlix"),
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 20),
              backgroundColor: Colors.blue,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => (Navigator.pop(context)),
              )),
          body: const Placeholder()),
    );
  }
}
