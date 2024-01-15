import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class EpisodeCardComponent {
  static Card episodeCard(String title, String image, String releaseDate,
      String href, BuildContext context, Player player) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        child: ListTile(
          leading: Image.network(image),
          title: Text(title),
          subtitle: Text(releaseDate),
        ),
        onTap: () {
          VidstreamScraper.directLinks(href)
              .then((value) => player.open(Media(value['source'][0]['file'])));
        },
      ),
    );
  }
}
