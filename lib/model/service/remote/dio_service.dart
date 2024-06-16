import 'package:dio/dio.dart';
import 'package:rick_morty/model/core/api_urls.dart';

class DioService {
  static final DioService _singleton = DioService._internal();
  final Dio _dio;

  factory DioService() {
    return _singleton;
  }

  DioService._internal() : _dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));

  Dio get client => _dio;
}
