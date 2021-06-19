/*
*   This file will be handling the parsing of rss feed data from : https://www.investing.com
*   The data will be, returned as a list of objects to be displayed in the views
* */

import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:smd_investments_website/models/models.dart';

class InvestingRssReader{

  // attributes
  static const Map<String,String> ANALYSIS_OPTION = {
    'Investing.com Analysis' : 'https://www.investing.com/rss/121899.rss',
    'Cryptocurrency Opinion & Analysis' : 'https://www.investing.com/rss/302.rss',
    'ETF Analysis & Opinion' : 'https://www.investing.com/rss/320.rss',
    'Market Overview' : 'https://www.investing.com/rss/market_overview.rss',
    'Market Overview Technical': 'https://www.investing.com/rss/market_overview_Technical.rss',
    'Market Overview Fundamental': 'https://www.investing.com/rss/market_overview_Fundamental.rss',
    'Market Overview Opinion': 'https://www.investing.com/rss/market_overview_Opinion.rss',
    'Market Overview Investing Ideas': 'https://www.investing.com/rss/market_overview_investing_ideas.rss',
    'Forex': 'https://www.investing.com/rss/forex.rss',
    'Forex Technical': 'https://www.investing.com/rss/forex.rss',
    'Forex Fundamental': 'https://www.investing.com/rss/forex_Fundamental.rss',
    'Forex Opinion': 'https://www.investing.com/rss/forex_Opinion.rss',
    'Forex Signals': 'https://www.investing.com/rss/forex_Signals.rss',
    'Most Popular Analysis' : 'https://www.investing.com/rss/286.rss',
    'Editor\'s Picks' : 'https://www.investing.com/rss/290.rss',
    'Stock' : 'https://www.investing.com/rss/stock.rss',
    'Stock Technical': 'https://www.investing.com/rss/stock_Technical.rss',
    'Stock Fundamental': 'https://www.investing.com/rss/stock_Fundamental.rss',
    'Stock Opinion' : 'https://www.investing.com/rss/stock_Opinion.rss',
    'Stock Picks' : 'https://www.investing.com/rss/stock_stock_picks.rss',
    'Stock Analysis': 'https://www.investing.com/rss/stock_Stocks.rss',
    'Indices Analysis': 'https://www.investing.com/rss/stock_Indices.rss',
    'Futures' : 'https://www.investing.com/rss/stock_Futures.rss',
    'ETFs': 'https://www.investing.com/rss/stock_ETFs.rss',
    'Options Analysis': 'https://www.investing.com/rss/stock_Options.rss',
    'Commodities' : 'https://www.investing.com/rss/commodities.rss',
    'Commodities Technical' : 'https://www.investing.com/rss/commodities_Technical.rss',
    'Commodities Fundamental' : 'https://www.investing.com/rss/commodities_Fundamental.rss',
    'Commodities Opinion' : 'https://www.investing.com/rss/commodities_Opinion.rss',
    'Commodities Strategy' : 'https://www.investing.com/rss/commodities_Strategy.rss',
    'Commodities Metals' : 'https://www.investing.com/rss/commodities_Metals.rss',
    'Commodities Energy' : 'https://www.investing.com/rss/commodities_Energy.rss',
    'Commodities Agriculture': 'https://www.investing.com/rss/commodities_Agriculture.rss',
    'Bonds' : 'https://www.investing.com/rss/bonds.rss',
    'Bonds Technical' : 'https://www.investing.com/rss/bonds_Technical.rss',
    'Bonds Fundamental': 'https://www.investing.com/rss/bonds_Fundamental.rss',
    'Bonds Opinion' : 'https://www.investing.com/rss/bonds_Opinion.rss',
    'Bonds Strategy' : 'https://www.investing.com/rss/bonds_Strategy.rss',
    'Government Bonds Analysis' : 'https://www.investing.com/rss/bonds_Government.rss',
    'Coporate Bonds Analysis' : 'https://www.investing.com/rss/bonds_Corporate.rss'
   };
  static const Map<String,String> NEWS = {
    'All News' : 'https://www.investing.com/rss/news.rss',
    'Cryptocurrency News' : 'https://www.investing.com/rss/news_301.rss',
    'Coronavirus News & Updates': 'https://www.investing.com/rss/news_2.rss',
    'Forex News' : 'https://www.investing.com/rss/news_1.rss',
    'Most Popular News' : 'https://www.investing.com/rss/news_285.rss',
    'Latest News' : '',
    'Commodities & Futures News' : 'https://www.investing.com/rss/news_11.rss',
    'Stock Market News' : 'https://www.investing.com/rss/news_25.rss',
    'Economic Indicators News' : 'https://www.investing.com/rss/news_95.rss',
    'Economy News' : 'https://www.investing.com/rss/news_14.rss',
    'World News' : 'https://www.investing.com/rss/news_287.rss',
    'Politics News' : 'https://www.investing.com/rss/news_289.rss',
    'Investing News' : 'https://www.investing.com/rss/investing_news.rss'
  };

  // methods

  // load rss feed based on selection of user.
  Future loadFeed(String group, String name) async{

    try{
      if(group == 'NEWS'){
        final response = await http.get(Uri.parse('${NEWS[name]}'));
        var decoded =  RssFeed.parse(response.body);
        return decoded.items!.map((item) => InvestingRssNews(
          enclosure: item.enclosure,
          title: item.title,
          pubDate: item.pubDate,
          author: item.author,
          link: item.link
        )).toList();
      }else if(group == 'ANALYSIS_OPTION'){
        Uri url = Uri.parse(ANALYSIS_OPTION[name].toString());
        http.Response response = await http.get(Uri.parse('https://www.investing.com/rss/news.rss'));

        var decoded = RssFeed.parse(response.body);
        return decoded.items!.map((item) => InvestingRssAnalysis(
          title: item.title,
          pubDate: item.pubDate,
          author: item.author,
          link: item.link
        )).toList();
      }
    }catch(e){
      print(e.toString());
      throw Exception(e.toString());
    }
  }



}