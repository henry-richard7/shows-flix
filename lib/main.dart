import 'package:flutter/material.dart';
import 'package:shows_flix/Pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("ShowsFlix"),
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            backgroundColor: Colors.blue,
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: HomePageWidget(),
          )),
    );
  }
}
