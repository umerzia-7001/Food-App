import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/errors.dart';
import 'package:food_app/core/auth/domain/login_service.dart';
import 'package:food_app/core/auth/models/user.dart';
import 'package:http/http.dart' as http;
import '../../../config/network/network_config.dart';

class LoginServiceImpl extends LoginService {
  final Dio dio = NetworkConfig().dio;

  @override
  Future<Response<dynamic>> emailLogin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // making user api call
    final response = await dio.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCsV2s-vpp3rftFD_3-2SyQzIt0BNAEOyc',
        data: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ));
    return response;
  }
}
