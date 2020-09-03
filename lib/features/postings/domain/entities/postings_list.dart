import 'package:equatable/equatable.dart';

class PostingsList extends Equatable {
  final List postingsList;

  PostingsList({this.postingsList});
  @override
  List<Object> get props => [postingsList];
}
