class PostResponse {
  final String id;
  final String title;
  final String url;
  final String publishedAt;
  final String createdAt;
  final String image;
  final num ratio;
  final String placeholder;
  final int views;
  final int readTime;
  final Publication publication;
  final List<String> tags;

  PostResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        url = json['url'],
        publishedAt = json['publishedAt'],
        createdAt = json['createdAt'],
        image = json['image'],
        ratio = json['ratio'],
        placeholder = json['placeholder'],
        views = json['views'],
        readTime = json['readTime'],
        publication = Publication.fromJson(json['publication']),
        tags = List<String>.from(json['tags'] as List);
}

class Publication {
  final String id;
  final String name;
  final String image;

  Publication.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];
}
