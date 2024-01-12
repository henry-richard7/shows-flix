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
            return homePageCard(pageData, index, context);
          }),
    );
  }

  static Card homePageCard(
      List<Map<String, dynamic>> pageData, int index, BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: [
            Flexible(
                child: Image.network(
              pageData[index]['image'],
              scale: 0.1,
            )),
            Text(
              pageData[index]['title'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(pageData[index]['release_date'])
          ],
        ),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EpisodesPage(
                        episodeUrl: pageData[index]['link'],
                      )))
        },
      ),
    );
  }
}
