import 'package:daily_mobile_app/src/rest/model/publication_response.dart';
import 'package:daily_mobile_app/src/rest/rest_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('check publications', () async {
    final url = 'https://app.dailynow.co/v1/publications';
    final response = await http.get(url);
    expect(response.statusCode, 200);
  });

  RestClient restClient;
  setUp(() {
    restClient = RestClient();
  });

  test('check rest client publications', () async {
    Future<List<PublicationResponse>> request = restClient.getPublications();
    List<PublicationResponse> publications = await request;
    expect(publications, isNotNull);
  });
}
