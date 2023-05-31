import 'package:dio/dio.dart';
import '../../../common/errors/exception.dart';
import '../../../common/network/dioClient.dart';
import '../../../util/endpoints.dart';
import '../model/model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> getNewsData();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final DioClient dioClient;

  const NewsRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<NewsModel> getNewsData() async {
    try {
      Response response = await dioClient.public.get(ApiEndpoints.baseUrl);
      return newsModelFromJson(response.data);
    } on DioError catch (err) {
      throw ServerException.fromDioError(err);
    } catch (e) {
      throw ServerException(errorMessage: '$e', unexpectedError: true);
    }
  }
}