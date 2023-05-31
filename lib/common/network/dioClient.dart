import 'package:dio/dio.dart';
import '../../util/endpoints.dart';

class DioClient {
  Dio public;

  DioClient({required this.public}) {
    public.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(milliseconds: 15000), // in milliseconds
      receiveTimeout: const Duration(milliseconds: 15000), // in milliseconds
      responseType: ResponseType.plain,
    );
  }
}