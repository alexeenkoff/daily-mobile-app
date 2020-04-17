import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/common/collection_extension.dart';

class PostsRestRepositoryImpl extends PostsRestRepository {
  final ApiClient postsClient;

  PostsRestRepositoryImpl(this.postsClient);

  @override
  Future<List<Post>> getPosts(List<Tag> tags, int page, int pageCount) {
    final tagsStrings = tags.mapToList((tag) => tag.text);
    return postsClient.getPosts(tagsStrings, page, pageCount).then((responses) {
      return responses.mapToList((response) => Post.fromResponse(response));
    });
  }
}
