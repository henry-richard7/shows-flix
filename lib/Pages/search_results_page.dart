import 'package:flutter/material.dart';
import 'package:shows_flix/Pages/episodes_page.dart';
import 'package:shows_flix/Scraper/vidstream_scraper.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  bool loading = true;
  List<Map<String, dynamic>> searchResults = [];

  @override
  void initState() {
    VidstreamScraper.search(widget.searchQuery).then((value) {
      searchResults = value;
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              (Navigator.pop(context));
            },
          )),
      body: (loading)
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Search Results for '${widget.searchQuery}'",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (BuildContext context, int index) {
                          String title = searchResults[index]['title'];
                          String image = searchResults[index]['image'];
                          String releaseDate =
                              searchResults[index]['release_date'];
                          String link = searchResults[index]['link'];

                          return InkWell(
                            child: Card(
                                child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 125,
                                      child: Image.network(image),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(releaseDate)
                                    ],
                                  ),
                                )
                              ],
                            )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EpisodesPage(
                                            episodeUrl: link,
                                            title: title,
                                            image: image,
                                          )));
                            },
                          );
                        }),
                  ),
                )
              ],
            ),
    ));
  }
}
