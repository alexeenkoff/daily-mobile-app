import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TagStorageRepositoryImpl implements TagStorageRepository {
  final Future<SharedPreferences> _sharedPreferences;
  static const String _key = 'TagStorageRepositoryImpl::tagsKey';

  TagStorageRepositoryImpl(this._sharedPreferences);

  @override
  Future<void> addSelectedTag(Tag tag) {
    return getSelectedTags().then((selectedTags) {
      selectedTags.add(tag);
      return _saveSelectedTags(selectedTags);
    });
  }

  @override
  Future<List<Tag>> getSelectedTags() {
    return _sharedPreferences.then((preferences) {
      return Future.value(preferences.getStringList(_key) ?? List());
    }).then((strings) {
      return strings.map((string) => Tag(string, true)).toList();
    });
  }

  Future<void> _saveSelectedTags(List<Tag> tags) {
    return _sharedPreferences.then((preferences) {
      final strings = tags.map((tag) => tag.text).toList();
      preferences.setStringList(_key, strings);
    });
  }

  @override
  Future<void> removeSelectedTag(Tag tag) {
    return getSelectedTags().then((selected) {
      selected.removeWhere((selectedTag) => selectedTag.text == tag.text);
      return Future.value(selected);
    }).then(_saveSelectedTags);
  }
}
