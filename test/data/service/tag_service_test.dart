import 'package:daily_mobile_app/src/data/repository/tag_rest_rep_impl.dart';
import 'package:daily_mobile_app/src/data/service/tag/tag_service.dart';
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
}

class MockTagRepository extends Mock implements TagRestRepositoryImpl {}

class MockStorageRepository extends Mock implements TagStorageRepository {}

