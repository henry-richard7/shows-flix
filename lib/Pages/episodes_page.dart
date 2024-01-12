import 'package:flutter/material.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key, required this.episodeUrl});
  final String episodeUrl;

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  @override
  Widget build(BuildContext context) {
    //print();
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
      ),
    );
  }
}
