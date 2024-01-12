import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key, required this.finalUrl});
  final String finalUrl;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
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
