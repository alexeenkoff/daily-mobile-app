import 'package:daily_mobile_app/src/api/model/post_response.dart';
import 'package:daily_mobile_app/src/api/posts_client.dart';
import 'package:graphql/client.dart';

class PostsClientImpl extends PostsClient {
  final _client = GraphQLClient(
      link: HttpLink(uri: 'https://app.dailynow.co/graphql'),
      cache: InMemoryCache());

  @override
  Future<List<PostResponse>> getPosts(List<String> tags, [DateTime dateTime]) {
    if (dateTime == null) {
      dateTime = DateTime.now();
    }
    final fetchLatest = r'''
    query fetchLatest($params: QueryPostInput) { latest(params: $params) {
      id,title,url,publishedAt,createdAt,image,ratio,placeholder,views,readTime,publication { id, name, image },
      tags
      } 
     }
       ''';
    final QueryOptions options = QueryOptions(
        documentNode: gql(fetchLatest),
        variables: <String, dynamic>{
          'params': {
            'latest': '${dateTime.toIso8601String()}',
            'page': 0,
            'pageSize': 30,
            'pubs': "",
            'sortBy': 'popularity',
            'tags': 'flutter,kotlin,android,dart,microservices,news'
          }
        });
    return _client.query(options).then((queryResult) {
      final list = queryResult.data['latest'] as List;
      final result = list.map((json) => PostResponse.fromJson(json)).toList();
      return Future.value(result);
    });
  }
}
