import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:encrypt/encrypt.dart';
import 'dart:convert';

class VidstreamScraper {
  static const String baseUrl = "https://asianload.info";
  static Map<String, String> headers = {
    "User-Agent":
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.0.43 Safari/537.36"
  };

  static final key = Key.fromUtf8("93422192433952489752342908585752");
  static final iv = IV.fromUtf8("9262859232435825");

  static String encrypt(String message) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(message, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String message) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(message), iv: iv);
    return decrypted;
  }

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
        episodePageDom.querySelectorAll("ul[class='listing items lists'] > li");

    dom.Element? description =
        episodePageDom.querySelector("div[class='content-more-js']");

    for (var element in episodeItems) {
      dom.Element? title = element.querySelector("div[class='name']");
      dom.Element? link = element.querySelector('a');
      dom.Element? image = element.querySelector('a > div > div > img');
      dom.Element? releasedDate = element.querySelector("a > div > span");

      episodes.add({
        "title": title!.text.trim(),
        "image": image!.attributes['src'],
        "link": "$baseUrl${link!.attributes['href']}",
        'release_date': releasedDate!.text.trim(),
        'description': description!.text.trim()
      });
    }

    return episodes;
  }

  static Future<Map<String, dynamic>> directLinks(String url) async {
    var request = await http.get(Uri.parse(url));
    request.headers.addAll(headers);

    dom.Document iframeHtmlDom = dom.Document.html(request.body);
    dom.Element? iframeObject = iframeHtmlDom.querySelector("iframe");

    String iframeUrl = "https:${iframeObject!.attributes['src']}";
    Uri parsedUri = Uri.parse(iframeUrl);

    Map<String, dynamic> parsedParameters = parsedUri.queryParametersAll;

    Map<String, dynamic> parsedParametersResult =
        Map<String, dynamic>.fromEntries(parsedParameters.entries
            .map((entry) => MapEntry(entry.key, entry.value[0])));

    String hostname = parsedUri.host.toString();
    String originalId = parsedParametersResult['id'];
    String encodedId = encrypt(originalId);

    parsedParametersResult['id'] = encodedId;
    parsedParametersResult['alias'] = originalId;

    Map<String, String> localHeaders = headers;
    localHeaders.addAll({'X-Requested-With': "XMLHttpRequest"});

    Uri encryptUrl = Uri(
        queryParameters: parsedParametersResult,
        host: hostname,
        path: "encrypt-ajax.php",
        scheme: "https");

    var request_2 = await http.get(encryptUrl);
    request_2.headers.addAll(localHeaders);

    Map<String, dynamic> encodedResponse = jsonDecode(request_2.body);
    String encryptedData = encodedResponse['data'];

    Map<String, dynamic> decryptedData = jsonDecode(decrypt(encryptedData));

    return decryptedData;
  }

  static Future<List<Map<String, dynamic>>> search(String searchQuery) async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var request =
        await http.get(Uri.parse("$baseUrl/search.html?keyword=$searchQuery"));
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
}
