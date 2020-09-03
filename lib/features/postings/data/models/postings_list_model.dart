import '../../domain/entities/postings_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostingsListModel extends PostingsList {
  final List postings;

  PostingsListModel(this.postings);

  factory PostingsListModel.fromHttpResponse(http.Response response) {
    List data = jsonDecode(response.body);
    return PostingsListModel(data);
  }

  List getPostingsList() {
    return postings;
  }
}
