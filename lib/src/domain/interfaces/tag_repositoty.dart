import 'package:daily_mobile_app/src/domain/entities/tag.dart';

abstract class TagRepository {
  Future<List<Tag>> getPopularTags();
}
