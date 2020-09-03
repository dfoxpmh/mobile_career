import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_career/features/postings/data/datasources/postings_list_remote_data_source.dart';
import 'package:mobile_career/features/postings/data/models/postings_list_model.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/core/errors/exceptions.dart';
import 'dart:convert';
import '../../../../fixtures/fixture_reader.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  final tURL = 'http://localhost/RESTFUL_API/index.php';
  PostingsListRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = PostingsListRemoteDataSourceImpl(client: mockHttpClient);
  });

  ///avoid writing lengthly calling when().then clause for success
  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async =>
            http.Response(fixture('full_postings_list.json'), 200));
  }

  ///avoid writing lengthly calling when().then clause for failure
  void setupMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async => http.Response('something went wrong', 404));
  }

  group('getPostingsListings', () {
    final tList = jsonDecode(fixture('full_postings_list.json'));
    final tPostingsListModel = PostingsListModel(tList);

    test('''should  perform a GET request on a URL
      being the endpoint and with application/json header''', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSource.getPostingsList();
      //assert
      verify(mockHttpClient.get(tURL, headers: {
        'Content-Type': 'application/json',
      }));
    }); //end test
  }); //end group
}
