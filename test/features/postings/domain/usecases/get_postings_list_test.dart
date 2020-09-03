import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_career/features/postings/domain/repositories/PostingListRepository.dart';
import 'package:mobile_career/features/postings/domain/usecases/get_postings_list.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../fixtures/fixture_reader.dart';

class MockPostingRepository extends Mock implements PostingsListRepository {}

void main() {
  GetPostingsList usecase;
  MockPostingRepository repository;
  final tList = jsonDecode(fixture('postings_list.json'));

  setUp(() {
    repository = MockPostingRepository();
    usecase = GetPostingsList(repository);
  });

  test('should get a List of postings (Strings that are maps)', () async {
    //arrange
    when(repository.getPostingsList())
        .thenAnswer((realInvocation) async => Right(tList));
    //act
    final result = await usecase.getPostingsList();
    //assert
    expect(result, Right(tList));
    verify(repository.getPostingsList());
    verifyNoMoreInteractions(repository);
  }); //end test
}
