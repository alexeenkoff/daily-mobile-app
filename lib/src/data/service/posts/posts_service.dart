import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';

class PostsService {
  final TagStorageRepository _tagStorageRepository;
  final PostsRestRepository _postsRestRepository;

  PostsService(this._tagStorageRepository, this._postsRestRepository);

  List<Post> posts = [];

  void initState() async {
    final savedTags = await _tagStorageRepository.getSelectedTags();
    posts = await _postsRestRepository.getPosts(savedTags, 0, 10);
  }
}
