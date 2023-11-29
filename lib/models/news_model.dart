class NewsData {
  final String id;
  final String? body;
  final bool hasBody;
  final String link;
  final String publishedAt;
  final int publishedTimestamp;
  final String imageUrl;
  final String sourceName;
  final String title;

  const NewsData({
    required this.id,
    required this.body,
    required this.hasBody,
    required this.link,
    required this.publishedAt,
    required this.publishedTimestamp,
    required this.imageUrl,
    required this.sourceName,
    required this.title,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      id: json['_id'],
      body: json['body'],
      hasBody: json['hasBody'],
      link: json['link'],
      publishedAt: json['publishedAt'],
      publishedTimestamp: json['publishedTimestamp'],
      imageUrl: json['image'],
      sourceName: json['sourceName'],
      title: json['title'],
    );
  }
}
