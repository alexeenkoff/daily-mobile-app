import 'package:daily_mobile_app/src/api/model/post_response.dart';

class Post {
  final String id;
  final String title;
  final String image;
  final List<String> tags;
  final int readTime;
  final String publicationImage;
  final String publishedAt;

  Post.fromResponse(PostResponse response)
      : id = response.id,
        title = response.title,
        image = response.image,
        tags = response.tags,
        readTime = response.readTime,
        publicationImage = response.publication.image,
        publishedAt = response.publishedAt;
}
