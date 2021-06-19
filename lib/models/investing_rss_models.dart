class InvestingRssAnalysis{

  final title;
  final pubDate;
  final author;
  final link;

  InvestingRssAnalysis({required this.title, required this.pubDate, required this.author, required this.link});

  factory InvestingRssAnalysis.fromJson(Map<String, dynamic> json) => InvestingRssAnalysis(
    title : json['title'],
    pubDate: json['pubDate'],
    author: json['author'],
    link: json['link']
  );
}

class InvestingRssNews{
  final enclosure;
  final title;
  final pubDate;
  final author;
  final link;

  InvestingRssNews({required this.enclosure, required this.title, required this.pubDate, required this.author, required this.link});

  factory InvestingRssNews.fromJson(Map<String, dynamic> json) => InvestingRssNews(
    enclosure: json['enclosure'],
    title : json['title'],
    pubDate: json['pubDate'],
    author : json['author'],
    link : json['link']
  );
}