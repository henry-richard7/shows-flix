import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.finalUrl});
  final String finalUrl;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  Map<String, dynamic> directLink = {};
  String stramingUrl = "";
  bool loading = true;

  late Player player = Player();
  late VideoController controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    VidstreamScraper.directLinks(widget.finalUrl).then((value) {
      directLink = value;
      setState(() {
        MediaKit.ensureInitialized();
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      stramingUrl = directLink['source'][0]['file'];
      player.open(Media(stramingUrl));
    }

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
                Navigator.pop(context);
                player.dispose();
              },
            )),
        body: (loading)
            ? const CircularProgressIndicator()
            : Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                  child: Video(
                    controller: controller,
                  ),
                ),
              ),
      ),
    );
  }
}
