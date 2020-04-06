import 'package:daily_mobile_app/src/api/model/post_response.dart';
import 'package:daily_mobile_app/src/api/posts_client.dart';
import 'package:daily_mobile_app/src/data/repository/posts/posts_rest_repository_impl.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final _postsClient = MockPostsClient();
  PostsRestRepositoryImpl _postsRestRep;

  setUp(() {
    _postsRestRep = PostsRestRepositoryImpl(_postsClient);
  });

  test('should return correct posts from post responses', () async {
    when(_postsClient.getPosts(any, 0, 0)).thenAnswer((_) => Future.value([
          PostResponse.fromJson(_fakePostJson('1', 'title_first')),
          PostResponse.fromJson(_fakePostJson('2', 'title_second'))
        ]));
    final queryTags = [Tag('string', true)];
    final result = await _postsRestRep.getPosts(queryTags, 0, 0);
    verify(_postsClient.getPosts(argThat(hasLength(1)), 0, 0));
    expect(result.length, equals(2));
    expect(result[0].title, equals('title_first'));
    expect(result[1].title, equals('title_second'));
  });
}

Map<String, dynamic> _fakePostJson(String id, String title) {
  return {
    'id': id,
    'title': title,
    'url': 'url',
    'publishedAt': 'publishedAt',
    'createdAt': 'createdAt',
    'image': 'image',
    'ratio': 2,
    'placeholder': 'placeholder',
    'views': 2,
    'readTime': 1,
    'publication': {'id': 'id', 'name': 'name', 'image': 'image'},
    'tags': ['first,second']
  };
}

class MockPostsClient extends Mock implements PostsClient {}
