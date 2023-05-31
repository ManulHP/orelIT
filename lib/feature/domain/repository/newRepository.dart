import 'package:dartz/dartz.dart';

import '../../../common/errors/failure.dart';
import '../entity/newsEntity.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewEntity>> getNews(String category);
}