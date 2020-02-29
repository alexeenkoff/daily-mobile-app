import 'dart:async';

import 'package:daily_mobile_app/src/rest/model/popular_tag_response.dart';
import 'package:daily_mobile_app/src/rest/model/post_response.dart';
import 'package:daily_mobile_app/src/rest/model/publication_response.dart';
import 'package:daily_mobile_app/src/rest/rest_clent.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'package:graphql/client.dart';

class RestClientImpl implements RestClient {
  final String _baseUrl = 'https://app.dailynow.co/v1/';

  @override
  Future<List<PublicationResponse>> getPublications() {
    return Future<List<PublicationResponse>>(() {
      return http.get(_baseUrl + 'publications').then((response) {
        final List resultJson = json.jsonDecode(response.body) as List;
        var resultList = resultJson
            .map((json) => PublicationResponse.fromJson(json))
            .toList();
        return Future.value(resultList);
      });
    });
  }

  @override
  Future<List<TagResponse>> getPopularTags() {
    return Future<List<TagResponse>>(() {
      return http.get(_baseUrl + 'tags/popular').then((response) {
        final List resultJson = json.jsonDecode(response.body) as List;
        return Future.value(
            resultJson.map((json) => TagResponse.fromJson(json)).toList());
      });
    });
  }

  @override
  Future<List<PostResponse>> getPosts() {
    final httpLink = HttpLink(uri: 'https://app.dailynow.co/graphql');
    final client = GraphQLClient(link: httpLink, cache: InMemoryCache());
    final fetchLatest = r'''
    query fetchLatest($params: QueryPostInput) { latest(params: $params) { id,title,url,publishedAt,createdAt,image,ratio,placeholder,views,readTime,publication { id, name, image },tags } }
       ''';
    final QueryOptions options = QueryOptions(
        documentNode: gql(fetchLatest),
        variables: <String, dynamic>{
          'params': {
            'latest': '2020-02-29T15:33:31.321Z',
            'page': 0,
            'pageSize': 30,
            'pubs': "",
            'sortBy': 'popularity',
            'tags': 'flutter,kotlin,android,dart,microservices,news'
          }
        });
    return client.query(options).then((queryResult) {
      final list = queryResult.data['latest'] as List;
      final result = list.map((json) => PostResponse.fromJson(json)).toList();
      return Future.value(result);
    });
  }

//  return Future
}

//  @override
//  Future<List<PostResponse>> getPosts() {
//    return Future<List<PostResponse>>(() {
//      final params = {
//        'params': {
//          'latest': '2020-02-29T15:33:31.321Z',
//          'page': 0,
//          'pageSize': 30,
////          'pubs': "",
//          'sortBy': 'popularity',
//          'tags': 'flutter,kotlin,android,dart,microservices,news'
//        }
//      };
//      final queryParams = {
//        'query':
//            'query fetchLatest(\$params: QueryPostInput) { latest(params: $params) { id,title,url,publishedAt,createdAt,image,ratio,placeholder,views,readTime,publication { id, name, image },tags } }',
//        'variables': '$params'
//      };
//      final url = Uri.https('app.dailynow.co', '/graphql', queryParams);
//      return http.get(url).then((response) {
//        final Map<String, dynamic> resultJson = json.jsonDecode(response.body);
//        final Map<String, dynamic> data = resultJson['data'];
//        final latest = data['latest'] as List;
//        final result =
//            latest.map((json) => PostResponse.fromJson(json)).toList();
//        return Future.value(result);
//      });
//    });
//  }
//}
