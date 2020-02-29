import 'dart:async';

import 'package:daily_mobile_app/src/rest/model/publication_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class RestClient {
  final String _baseUrl = 'https://app.dailynow.co/v1/';

  Future<List<PublicationResponse>> getPublications() {
    return Future<List<PublicationResponse>>(() {
      return http.get(_baseUrl + 'publications').then((response) {
        final List resultJson =
            json.jsonDecode(response.body) as List;
        var resultList = resultJson
            .map((json) => PublicationResponse.fromJson(json))
            .toList();
        return Future.value(resultList);
      });
    });
  }
}
