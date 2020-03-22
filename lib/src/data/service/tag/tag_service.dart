import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';

class TagService {
  final TagRestRepository _tagRestRepository;
  final TagStorageRepository _tagStorageRepository;

  TagService(this._tagRestRepository, this._tagStorageRepository);

  List<Tag> tags;
  List<Tag> selectedTags;

  void initState() async {
    tags = await _tagRestRepository.getPopularTags();
    selectedTags = await _tagStorageRepository.getSelectedTags();
  }

  void searchTags(String query) async {
    tags = query.isEmpty
        ? await _tagRestRepository.getPopularTags()
        : await _tagRestRepository.searchTag(query);
  }

  void onTagClick(String text, bool isChecked) async {
    if (isChecked) {
      selectedTags.add(Tag(text));
    } else {
      Tag needDelete;
      selectedTags.forEach((tag) {
        if (tag.text == text) {
          needDelete = tag;
        }
      });
      if (needDelete != null) {
        selectedTags.remove(needDelete);
      }
    }
  }
}
