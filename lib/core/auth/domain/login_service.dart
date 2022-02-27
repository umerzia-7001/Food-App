import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:food_app/core/auth/models/user.dart';

abstract class LoginService {
  Future<Response<dynamic>> emailLogin({
    required BuildContext context,
    required String email,
    required String password,
  });
}
