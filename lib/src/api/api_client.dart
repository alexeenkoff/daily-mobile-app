import 'package:daily_mobile_app/src/api/model/popular_tag_response.dart';
import 'package:daily_mobile_app/src/api/model/publication_response.dart';
import 'package:daily_mobile_app/src/api/posts_client.dart';

abstract class ApiClient implements PostsClient {
  Future<List<PublicationResponse>> getPublications();

  Future<List<TagResponse>> getPopularTags();

  Future<List<TagResponse>> searchTags(String query);
}
