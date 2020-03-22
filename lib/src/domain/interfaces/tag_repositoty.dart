import 'package:daily_mobile_app/src/domain/entities/tag.dart';

abstract class TagRestRepository {
  Future<List<Tag>> getPopularTags();

  Future<List<Tag>> searchTag(String query);
}

abstract class TagStorageRepository {
  Future<void> addSelectedTag(Tag tag);

  Future<List<Tag>> getSelectedTags();
}
