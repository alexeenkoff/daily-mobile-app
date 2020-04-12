import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';

class PostsRestRepositoryImpl extends PostsRestRepository {
  final ApiClient postsClient;

  PostsRestRepositoryImpl(this.postsClient);

  @override
  Future<List<Post>> getPosts(List<Tag> tags, int page, int pageCount) {
    return Future.value(tags).then((tags) {
      return tags.map((tag) => tag.text).toList();
    }).then((stringTags) {
      return postsClient
          .getPosts(stringTags, page, pageCount)
          .then((responses) {
        return responses
            .map((response) => Post.fromResponse(response))
            .toList();
      });
    });
  }
}
