class NewsModel {
  int? totalResult;
  String? status;
  List<dynamic>? articles;

  NewsModel({this.totalResult, this.status, this.articles});

  factory NewsModel.fromJson(Map m1) {
    return NewsModel(
        totalResult: m1['totalResults'],
        status: m1['status'],
        articles: m1['articles'].map((e) => Articles.fromJson(e)).toList());
  }
}

class Articles {
  String? author, title, description, uri, uriimg, publish, content;

  Articles(
      {this.author,
      this.title,
      this.description,
      this.uri,
      this.uriimg,
      this.publish,
      this.content});

  factory Articles.fromJson(Map m1) {
    return Articles(
        author: m1['author'],
        title: m1['title'],
        description: m1['description'],
        uri: m1['uri'],
        uriimg: m1['urlToImage'],
        publish: m1['publishedAt'],
        content: m1['content']);
  }
}
