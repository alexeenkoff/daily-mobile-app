import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';

class PostsService {
  final TagStorageRepository _tagStorageRepository;
  final PostsRestRepository _postsRestRepository;

  PostsService(this._tagStorageRepository, this._postsRestRepository);

  List<Post> posts = [];
  var _page = 0;

  void initState() async {
    final savedTags = await _tagStorageRepository.getSelectedTags();
    posts = await _postsRestRepository.getPosts(savedTags, _page, 10);
  }

  void loadNextPage() async {
    _page++;
    final savedTags = await _tagStorageRepository.getSelectedTags();
    final nextPagePosts = await _postsRestRepository.getPosts(savedTags, _page, 10);
    posts.addAll(nextPagePosts);
  }
}
