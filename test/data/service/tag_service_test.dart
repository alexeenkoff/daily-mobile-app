import 'package:daily_mobile_app/src/data/repository/tag_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final _mockRepository = MockTagRepository();
  TagService _tagService;
  setUp(() {
    _tagService = TagService(_mockRepository);
  });
}

class MockTagRepository extends Mock implements TagRepositoryImpl {}
