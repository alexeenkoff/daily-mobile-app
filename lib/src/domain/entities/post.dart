import 'package:daily_mobile_app/src/api/model/post_response.dart';

class Post {
  final String id;
  final String title;

  Post.fromResponse(PostResponse response)
      : id = response.id,
        title = response.title;
}
