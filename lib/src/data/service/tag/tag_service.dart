import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';

class TagService {
  final TagRepository _tagRepository;

  TagService(this._tagRepository);

  List<Tag> tags;

  void popularTags() async {
    tags = await _tagRepository.getPopularTags();
  }
}
