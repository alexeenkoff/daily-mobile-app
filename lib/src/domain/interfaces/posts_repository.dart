import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';

abstract class PostsRestRepository {

  Future<List<Post>> getPosts(List<Tag> tags, int page, int pageCount);

}