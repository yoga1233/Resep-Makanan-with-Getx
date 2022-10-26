import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import 'method.dart';

class CobaService {
  Dio? _dio;

  Future<CobaService> init() async {
    log("Api Service Initialized");
    _dio = Dio(
      BaseOptions(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    initInterceptor();
    return this;
  }

  void initInterceptor() {
    _dio?.interceptors.add(dioLoggerInterceptor);
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, String>? headers,
    Map<String, String>? parameters,
  }) async {
    Response? response;

    try {
      if (method == Method.POST) {
        response = await _dio!.post(url);
      } else if (method == Method.GET) {
        response = await _dio!.get(url);
      }

      if (response!.statusCode == 200) {
        return checkResponse(response: response);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> checkResponse({required dynamic response}) {
    if (response[''] == 200) {
      return response;
    }
    throw Exception(Response);
  }
}
