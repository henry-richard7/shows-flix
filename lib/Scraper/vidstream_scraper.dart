import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class VidstreamScraper {
  static const String baseUrl = "https://asianload.io";
  static Future<List<Map<String, dynamic>>> recentlyAdded() async {
    List<Map<String, dynamic>> results = <Map<String, dynamic>>[];

    var headers = {
      "User-Agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.0.43 Safari/537.36"
    };

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
}
