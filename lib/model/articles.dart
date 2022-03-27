class Article {
  Article({
    this.author,
    this.title,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"] ?? "Author",
    title: json["title"] ?? "Title",
    urlToImage: json["urlToImage"] ?? "https://wiki.tripwireinteractive.com/images/4/47/Placeholder.png",
    publishedAt: DateTime.parse(json["publishedAt"] ?? "Date Time"),
    content: json["content"] == null ? null : json["content"],
  );

}
