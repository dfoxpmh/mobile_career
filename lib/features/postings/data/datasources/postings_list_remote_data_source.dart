import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:mobile_career/features/postings/data/models/postings_list_model.dart';

abstract class PostingsListRemoteDataSource {
  ///calls http://http://localhost/RESTFUL_API/index.php  end point
  ///TODO change to brweb server when live - pmh-mb.ca/RESTAPI/index.php
  ///
  ///Throw a Server Exception for all errors
  ///
  Future<PostingsListModel> getPostingsList();
}

class PostingsListRemoteDataSourceImpl implements PostingsListRemoteDataSource {
  final http.Client client;

  PostingsListRemoteDataSourceImpl({@required this.client});

  @override
  Future<PostingsListModel> getPostingsList() {
    return _getPostingsFromURL('http://localhost/RESTFUL_API/index.php');
  }

  Future<PostingsListModel> _getPostingsFromURL(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return PostingsListModel.fromHttpResponse(response);
  }
}
