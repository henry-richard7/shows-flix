import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class VidstreamScraper {
  static const String baseUrl = "https://asianload.io";
  static const Map<String, String> headers = {
    "User-Agent":
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.0.43 Safari/537.36"
  };

  static Future<List<Map<String, dynamic>>> recentlyAdded() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request = await http.get(Uri.parse("$baseUrl/?page=1"));
    request.headers.addAll(headers);

    dom.Document recentlyAddedPageDom = dom.Document.html(request.body);
    List<dom.Element> items =
        recentlyAddedPageDom.querySelectorAll("ul[class='listing items'] > li");

    for (var element in items) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      results.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return results;
  }

  static Future<List<Map<String, dynamic>>> recentlyAddedRaw() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request =
        await http.get(Uri.parse("$baseUrl/recently-added-raw?page=1"));
    request.headers.addAll(headers);

    dom.Document recentlyAddedPageDom = dom.Document.html(request.body);
    List<dom.Element> items =
        recentlyAddedPageDom.querySelectorAll("ul[class='listing items'] > li");

    for (var element in items) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      results.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return results;
  }

  static Future<List<Map<String, dynamic>>> recentlyAddedMovies() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request = await http.get(Uri.parse("$baseUrl/movies?page=1"));
    request.headers.addAll(headers);

    dom.Document recentlyAddedPageDom = dom.Document.html(request.body);
    List<dom.Element> items =
        recentlyAddedPageDom.querySelectorAll("ul[class='listing items'] > li");

    for (var element in items) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      results.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return results;
  }

  static Future<List<Map<String, dynamic>>> popularShows() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request = await http.get(Uri.parse("$baseUrl/popular?page=1"));
    request.headers.addAll(headers);

    dom.Document recentlyAddedPageDom = dom.Document.html(request.body);
    List<dom.Element> items =
        recentlyAddedPageDom.querySelectorAll("ul[class='listing items'] > li");

    for (var element in items) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      results.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return results;
  }

  static Future<List<Map<String, dynamic>>> ongoingShows() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request = await http.get(Uri.parse("$baseUrl/ongoing-series?page=1"));
    request.headers.addAll(headers);

    dom.Document recentlyAddedPageDom = dom.Document.html(request.body);
    List<dom.Element> items =
        recentlyAddedPageDom.querySelectorAll("ul[class='listing items'] > li");

    for (var element in items) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      results.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return results;
  }

  static Future<List<Map<String, dynamic>>> episodesList(String url) async {
    List<Map<String, dynamic>> episodes = [];

    var request = await http.get(Uri.parse(url));
    request.headers.addAll(headers);

    dom.Document episodePageDom = dom.Document.html(request.body);

    List<dom.Element> episodeItems =
        episodePageDom.querySelectorAll("ul[class='listing items list'] > li");

    for (var element in episodeItems) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      episodes.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim()
      });
    }

    return episodes;
  }
}
