import 'package:flutter/material.dart';
import 'package:shows_flix/Pages/player_page.dart';

class EpisodeCardComponent {
  static Card episodeCard(String title, String image, String releaseDate,
      String href, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: ListTile(
          leading: Image.network(image),
          title: Text(title),
          subtitle: Text(releaseDate),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => VideoPlayerPage(finalUrl: href)));
        },
      ),
    );
  }
}
