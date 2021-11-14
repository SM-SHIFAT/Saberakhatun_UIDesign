class HeadlineTopicModel {
  HeadlineTopicModel({
    required this.feed,
    required this.articles,
  });
  late final Feed feed;
  late final List<Articles> articles;

  HeadlineTopicModel.fromJson(Map<String, dynamic> json) {
    feed = Feed.fromJson(json['feed']);
    articles =
        List.from(json['articles']).map((e) => Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['feed'] = feed.toJson();
    _data['articles'] = articles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Feed {
  Feed({
    required this.title,
    required this.updated,
    required this.link,
    required this.language,
    required this.subtitle,
    required this.rights,
  });
  late final String title;
  late final String updated;
  late final String link;
  late final String language;
  late final String subtitle;
  late final String rights;

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    updated = json['updated'];
    link = json['link'];
    language = json['language'];
    subtitle = json['subtitle'];
    rights = json['rights'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['updated'] = updated;
    _data['link'] = link;
    _data['language'] = language;
    _data['subtitle'] = subtitle;
    _data['rights'] = rights;
    return _data;
  }
}

class Articles {
  Articles({
    required this.id,
    required this.title,
    required this.link,
    required this.published,
    required this.subArticles,
    required this.source,
  });
  late final String id;
  late final String title;
  late final String link;
  late final String published;
  late final List<SubArticles> subArticles;
  late final Source source;

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    published = json['published'];
    subArticles = List.from(json['sub_articles'])
        .map((e) => SubArticles.fromJson(e))
        .toList();
    source = Source.fromJson(json['source']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['link'] = link;
    _data['published'] = published;
    _data['sub_articles'] = subArticles.map((e) => e.toJson()).toList();
    _data['source'] = source.toJson();
    return _data;
  }
}

class SubArticles {
  SubArticles({
    required this.url,
    required this.title,
    required this.publisher,
  });
  late final String url;
  late final String title;
  late final String publisher;

  SubArticles.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    publisher = json['publisher'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['title'] = title;
    _data['publisher'] = publisher;
    return _data;
  }
}

class Source {
  Source({
    required this.href,
    required this.title,
  });
  late final String href;
  late final String title;

  Source.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    _data['title'] = title;
    return _data;
  }
}
