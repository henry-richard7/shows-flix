import 'package:flutter/material.dart';

class EpisodeCardComponent {
  static Card episodeCard(
      String title, String image, String releaseDate, String href) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.network(image),
        title: Text(title),
        subtitle: Text(releaseDate),
      ),
    );
  }
}
