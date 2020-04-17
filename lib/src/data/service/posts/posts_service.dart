import 'package:daily_mobile_app/src/domain/entities/post.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/posts_repository.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';

class PostsService {
  final TagStorageRepository _tagStorageRepository;
  final PostsRestRepository _postsRestRepository;
  static const _PAGE_SIZE = 10;

  PostsService(this._tagStorageRepository, this._postsRestRepository);

  List<Post> posts = [];
  var _page = 0;

  void initState() async {
    posts = await _loadPage(_page);
  }

  void loadNextPage() async {
    _page++;
    final nextPagePosts = await _loadPage(_page);
    posts.addAll(nextPagePosts);
  }

  Future<List<Post>> _loadPage(int page) async {
    final savedTags = await _tagStorageRepository.getSelectedTags();
    return await _postsRestRepository.getPosts(savedTags, page, _PAGE_SIZE);
  }
}
