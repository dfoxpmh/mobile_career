import 'package:dartz/dartz.dart';
//import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../entities/posting.dart';
import 'package:mobile_career/features/postings/domain/repositories/PostingListRepository.dart';

class GetPostingsList {
  final PostingsListRepository repository;

  GetPostingsList(this.repository);

  Future<Either<Failure, List>> getPostingsList() async {
    var postings = await repository.getPostingsList();
    return postings;
  }
}
