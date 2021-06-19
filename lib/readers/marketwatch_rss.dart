import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:smd_investments_website/models/models.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class MarketWatchRssReader{

  static const Map<String,String> URLS = {
    'Top Stories' : 'http://feeds.marketwatch.com/marketwatch/topstories/',
    'Real-time Headlines' : 'http://feeds.marketwatch.com/marketwatch/realtimeheadlines/',
    'Market Pulse' : 'http://feeds.marketwatch.com/marketwatch/marketpulse/',
    'Breaking News Bulletins' : 'http://feeds.marketwatch.com/marketwatch/bulletins',
  };

  // methods
  Future initiate(String name) async{
    var client = http.Client();
    http.Response response = await client.get(Uri.parse(URLS[name].toString()));
    //print(response.body);

    var document = parse(response.body);
    List<Element> links = document.getElementsByTagName('ul > li.regularitem >');

    for(var i = 0; i < links.length; i++){
      Element temp = links[i];
      print(temp.innerHtml);
    }
  }

  Future loadFeed(String name) async{
    try{

    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }
}