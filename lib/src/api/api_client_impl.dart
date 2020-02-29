import 'dart:async';

import 'package:daily_mobile_app/src/api/model/popular_tag_response.dart';
import 'package:daily_mobile_app/src/api/model/post_response.dart';
import 'package:daily_mobile_app/src/api/model/publication_response.dart';
import 'package:daily_mobile_app/src/api/api_client.dart';
import 'package:daily_mobile_app/src/api/posts_client.dart';
import 'package:daily_mobile_app/src/api/posts_client_impl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiClientImpl implements ApiClient {
  final String _baseUrl = 'https://app.dailynow.co/v1/';
  final PostsClient _postsClient = PostsClientImpl();

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
    return _postsClient.getPosts();
  }
}
