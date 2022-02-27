import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import './dio_interceptor.dart';

class NetworkConfig {
  static final NetworkConfig _instance = NetworkConfig._internal();

  late Dio dio;

  static const _URL = "";

  factory NetworkConfig() {
    return _instance;
  }

  NetworkConfig._internal();

  void initNetworkConfig() {
    late String baseUrl;

    baseUrl = _URL;

    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ))
      ..interceptors.add(DioInterceptior());
  }
}
