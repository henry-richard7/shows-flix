import 'package:flutter/material.dart';
import 'package:shows_flix/Pages/home_page.dart';
import 'package:shows_flix/Pages/search_results_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final searchTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("ShowsFlix"),
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: searchTextFieldController,
                          decoration: const InputDecoration(
                              label: Text("Search"),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                              onPressed: () => (Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchResultsPage(
                                            searchQuery:
                                                searchTextFieldController.text,
                                          )))),
                              child: const Row(
                                children: [
                                  Icon(Icons.search),
                                  Text("SEARCH"),
                                ],
                              ));
                        }),
                      )
                    ],
                  ),
                ),
                const Flexible(child: HomePageWidget()),
              ],
            ),
          )),
    );
  }
}
