import 'dart:async';

import 'package:daily_mobile_app/src/rest/model/popular_response.dart';
import 'package:daily_mobile_app/src/rest/model/publication_response.dart';
import 'package:daily_mobile_app/src/rest/rest_clent_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

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
  Future<List<PopularResponse>> getPopular() {
    return Future<List<PopularResponse>>(() {
      return http.get(_baseUrl + 'tags/popular')
          .then((response) {
        final List resultJson = json.jsonDecode(response.body) as List;
        return Future.value(resultJson.map((json) =>
            PopularResponse.fromJson(json)).toList());
        });
    });
  }
}
