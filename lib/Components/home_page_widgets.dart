import 'package:flutter/material.dart';
import 'package:shows_flix/Pages/episodes_page.dart';

class HomePageWidgets {
  static SizedBox homePageGrid(
      List<Map<String, dynamic>> pageData, BuildContext context) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: pageData.length,
          itemBuilder: (builder, index) {
            String title = pageData[index]['title'];
            String image = pageData[index]['image'];
            String releaseDate = pageData[index]['release_date'];
            String link = pageData[index]['link'];

            return homePageCard(title, image, releaseDate, link, context);
          }),
    );
  }

  static Card homePageCard(String title, String image, String releaseDate,
      String link, BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: [
            Flexible(
                child: Image.network(
              image,
              scale: 0.1,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(releaseDate)
          ],
        ),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EpisodesPage(
                        episodeUrl: link,
                        title: title,
                        image: image,
                      )))
        },
      ),
    );
  }
}
