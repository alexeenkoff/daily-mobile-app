import 'package:daily_mobile_app/src/data/repository/tag_rest_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:daily_mobile_app/src/domain/entities/tag.dart';
import 'package:daily_mobile_app/src/domain/interfaces/tag_repositoty.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final _restRepository = MockTagRepository();
  final _storageRepository = MockStorageRepository();
  TagService _tagService;
  setUp(() {
    _tagService = TagService(_restRepository, _storageRepository);
  });

  test('should return popular from rest on empty search', () async {
    var first = Tag('first', false);
    var second = Tag('second', true);
    when(_restRepository.getPopularTags()).thenAnswer((_) {
      var fakeTags = [first, second];
      return Future.value(List.of(fakeTags));
    });
    _tagService.selectedTags = {};
    await _tagService.loadTags('');
    expect(_tagService.tags.length, equals(2));
    expect(_tagService.tags[0], equals(first));
    expect(_tagService.tags[1], equals(second));
    verifyNever(_restRepository.searchTag(''));
  });

  test('should remove tag from storage', () async {
    var tag = Tag('first', true);
    _tagService.selectedTags = {tag};
    await _tagService.onTagClick('#first', false);
    verify(_storageRepository.removeSelectedTag(argThat(equals(tag))));
    expect(_tagService.selectedTags.length, equals(0));
  });

  test('should add tag to storage', () async {
    var tag = Tag('tag', true);
    _tagService.selectedTags = {tag};
    await _tagService.onTagClick('#tag', true);
    verify(_storageRepository.addSelectedTag(argThat(equals(tag))));
    expect(_tagService.selectedTags.length, equals(1));
  });

  test('should show explanation works fine', () async {
    when(_restRepository.getPopularTags()).thenAnswer((_) {
      return Future.value([]);
    });
    when(_restRepository.searchTag(any)).thenAnswer((_) {
      return Future.value([]);
    });
    _tagService.selectedTags = {};
    await _tagService.loadTags('');
    expect(_tagService.needShowExplanation, equals(true));
    await _tagService.loadTags('some_query');
    expect(_tagService.needShowExplanation, equals(false));
  });
}

class MockTagRepository extends Mock implements TagRestRepositoryImpl {}

class MockStorageRepository extends Mock implements TagStorageRepository {}
