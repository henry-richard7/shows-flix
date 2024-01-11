import 'package:flutter/material.dart';

class HomePageWidgets {
  static SizedBox homePageGrid(List<Map<String, dynamic>> pageData) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: pageData.length,
          itemBuilder: (builder, index) {
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
                onTap: () => print(pageData[index]['link']),
              ),
            );
          }),
    );
  }
}
