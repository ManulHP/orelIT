import 'package:dartz/dartz.dart';
import '../../../common/errors/failure.dart';
import '../../../common/usecase/usecase.dart';
import '../entity/newsArticle.dart';
import '../repository/newRepository.dart';

class GetNewsUseCase implements UseCase<NewEntity, String> {
  final NewsRepository repository;

  GetNewsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NewEntity>> call(String catergory) async {
    return await repository.getNews(catergory);
  }
}
