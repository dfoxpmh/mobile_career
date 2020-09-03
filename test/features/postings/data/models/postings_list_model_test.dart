import 'package:mobile_career/features/postings/data/models/postings_list_model.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../lib/features/postings/domain/entities/postings_list.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'package:http/http.dart' as http;

class MockHttpResponse extends Mock implements http.Response {}

void main() {
  final tPostingsList = jsonDecode(fixture('postings_list.json'));
  final tHttpQuery = fixture('postings_list.json');
  final tPostingsListModel = PostingsListModel(tPostingsList);
  MockHttpResponse mockHttpResponse;

  setUp(() {
    mockHttpResponse = MockHttpResponse();
  });
  /*  test('should be a subclass of PostingsList entity', () async {
    //assert
    expect(tPostingsListModel, isA<PostingsList>());
  }); //end test */
  test('should return a PostingsListModel from a html respose', () async {
    //arrange
    when(mockHttpResponse.body).thenAnswer((realInvocation) => tHttpQuery);
    //act
    final result = PostingsListModel.fromHttpResponse(mockHttpResponse);
    //assert
    expect(result, tPostingsListModel);
  }); //end test

  test(
      'should return a list of raw postings strings when getPostingsList is called',
      () async {
    final result = tPostingsListModel.getPostingsList();
    //assert
    expect(result, tPostingsList);
  }); //end test
}
