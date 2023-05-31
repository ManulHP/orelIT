import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:orel_it/common/errors/failure.dart';

import 'package:orel_it/feature/domain/entity/newsArticle.dart';

import '../../../common/errors/exception.dart';
import '../../../common/network/internet_connectivity.dart';
import '../../domain/repository/newRepository.dart';
import '../datasource/newRemoteDataSource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NewEntity>> getNews(String catergory) async {
    if (await networkInfo.isConnectedToInternet) {
      try {
        final news = await remoteDataSource.getNewsData(catergory);
        return Right(news.toEntity());
      } on ServerException catch (serverException) {
        debugPrint("news: ${serverException.data?.requestData.url}");
        debugPrint("news: ${serverException.data?.responseData.data}");
        return Left(ServerFailure(message: serverException.errorMessage));

      }
    } else {
      debugPrint("failed #7845");
      return const Left(ServerFailure(message: "No Internet Connection"));
    }
  }

}