import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const baseUrl = "https://query2.finance.yahoo.com/v8/";

final dioProvider = Provider((ref) {
    return DioClientBuilder(baseUrl: baseUrl);
});

class DioClientBuilder {
  String baseUrl;

  DioClientBuilder({ required this.baseUrl});

  Dio build() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );

    var dio = Dio(options);

    return dio;
  }
}