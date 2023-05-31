import 'package:dartz/dartz.dart';
import '../../../common/errors/failure.dart';
import '../../../common/usecase/usecase.dart';
import '../entity/newsEntity.dart';
import '../repository/newRepository.dart';

class GetNewsUseCase implements UseCase<NewEntity, String> {
  final NewsRepository repository;

  GetNewsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NewEntity>> call(String category) async {
    return await repository.getNews(category);
  }
}
