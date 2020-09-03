import 'package:dartz/dartz.dart';
import 'package:mobile_career/core/errors/failures.dart';
import 'package:mobile_career/features/postings/domain/entities/postings_list.dart';

abstract class PostingsListRepository {
  Future<Either<Failure, List>> getPostingsList();
}
