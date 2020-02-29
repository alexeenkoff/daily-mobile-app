import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/api/api_client_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  ApiClient restClient;
  setUp(() {
    restClient = ApiClientImpl();
  });

  test('check posts', () async {
    final url =
        'https://app.dailynow.co/graphql?query=query+fetchLatest(\$params:+QueryPostInput)+%7B+latest(params:+\$params)+%7B+id,title,url,publishedAt,createdAt,image,ratio,placeholder,views,readTime,publication+%7B+id,+name,+image+%7D,tags+%7D+%7D&variables=%7B%22params%22:%7B%22latest%22:%222020-02-29T15:33:31.321Z%22,%22page%22:0,%22pageSize%22:30,%22pubs%22:%22%22,%22tags%22:%22flutter,kotlin,android,dart,microservices,news%22,%22sortBy%22:%22popularity%22%7D%7D';
    final response = await http.get(url);
    expect(response.statusCode, 200);
  });

  test('check posts rest client', () async {
    final posts = await restClient.getPosts();
    expect(posts, isNotNull);
    var firstPost = posts[0];
    expect(firstPost.url, isNotNull);
    expect(firstPost.publication, isNotNull);
    expect(firstPost.title, isNotNull);
  });
}
