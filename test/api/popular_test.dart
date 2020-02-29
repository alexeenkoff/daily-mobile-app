import 'package:daily_mobile_app/src/rest/rest_clent.dart';
import 'package:daily_mobile_app/src/rest/rest_client_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  RestClient restClient;
  setUp(() {
    restClient = RestClientImpl();
  });

  test('check popular tags', () async {
    final url = 'https://app.dailynow.co/v1/tags/popular';
    final response = await http.get(url);
    expect(response.statusCode, 200);
  });

  test('check rest client popular tags', () async {
    final tags = await restClient.getPopularTags();
    expect(tags, isNotNull);
  });
}
