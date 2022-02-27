import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:food_app/config/network/network_config.dart';
import 'package:food_app/core/auth/domain/login_service.dart';
import 'package:food_app/core/auth/models/user.dart';
import 'package:food_app/core/auth/services/login_impl.dart';
import 'package:food_app/core/menu/presentation/home_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/errors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// Include generated file
part 'auth_providers.g.dart';

// This is the class used by rest of your codebase
class Auth = _Auth with _$Auth;

abstract class _Auth with ChangeNotifier, Store {
  String tokens;
  String userId;
  DateTime _expiresIn = DateTime.now();
  bool _isAuth = false;
  Timer _authTimer = Timer(Duration(seconds: 60), () {});

  _Auth({required this.tokens, required this.userId});

  final Dio dio = NetworkConfig().dio;
  final LoginService _loginService = LoginServiceImpl();

//  to observe loading states in UI
  @observable
  bool isEmailLoading = false;
  @observable
  late bool isEmailDone = false;

// to check if user is already authenticated
  bool get isAuthenticated => _isAuth;

  set isAuthenticated(bool isAuth) {
    if (tokens != null) {
      _isAuth = isAuth;
      notifyListeners();
    }
  }

  bool get authenticated {
    return tokens != null;
  }

  String get token {
    // checking if token is valid w.r.t date
    if (_expiresIn != null &&
        _expiresIn.isAfter(DateTime.now()) &&
        tokens != null) {
      return tokens;
    }
    return tokens;
  }

  // logout function to logout user
  Future<void> logout() async {
    isAuthenticated = false;
    tokens = '';
    userId = '';
    _expiresIn = DateTime.now();
    if (_authTimer != null) {
      _authTimer.cancel();
      // _authTimer = null;
    }
  }

  // EMAIL AUTTH
  @action
  Future<void> emailLogin(
      BuildContext context, String email, String password) async {
    final body = {"email": email.trim(), 'password': password.trim()};

    try {
      isEmailLoading = true;

      Response<dynamic> response = await _loginService.emailLogin(
          context: context, email: email, password: password);

      isEmailLoading = false;

      final responseData = (response.data) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        isEmailLoading = false;
        isEmailDone = true;
        final pref = await SharedPreferences.getInstance();

        final Map<String, dynamic> parsed = (responseData);
        // Saving json response in user model
        final User userData = User.fromJson(parsed);
        print(userData);

        tokens = responseData['idToken'];
        userId = responseData['localId'];
        _expiresIn = DateTime.now().add(
          // response also has a expiry date for token
          Duration(
            seconds: int.parse(
              responseData['expiresIn'],
            ),
          ),
        );

        isAuthenticated = true;
        print('tokens');
        print(tokens);
        notifyListeners();

        // saving token in local storage
        await pref.setString('token', tokens);

        final user = json.encode(
          {
            'token': tokens,
            'userId': userId,
            'expiryDate': _expiresIn.toIso8601String(),
          },
        );

        //saving user auth state in preferences
        pref.setString('user', user);

        Future.delayed(const Duration(milliseconds: 1), () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => HomeScreen(),
            ),
          );
        });
      } else {
        isEmailLoading = false;
        log('${response.statusCode}');
        final String errorMsg = response.data['error']['message'].toString();
        _showSnackBar(context, errorMsg);
      }
    } on HttpException catch (error) {
      isEmailLoading = false;
      // error handling wrt response recieved : Firebase specific
      var errorMessage = 'Authentication failed';

      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showSnackBar(context, errorMessage);
    } on DioError catch (e) {
      // handling DIO errors
      String errorMessage = e.response!.data['error']['message'].toString();

      isEmailLoading = false;
      if (e.response!.statusCode != 200) {
        print(e.response!.data['error']['message'].toString());
        _showSnackBar(context, errorMessage);
      } else {
        log(e.toString());
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.white,
        content: Text(message,
            style: const TextStyle(color: Colors.red, fontSize: 15.0))));
  }

  Future<bool> tryAutoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('user')) {
      return false;
    }
    final userData =
        json.decode(pref.getString('user')!) as Map<String, Object>;
    final expiryDate = DateTime.parse(userData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    tokens = userData['idToken'] as String;
    userId = userData['localId'] as String;
    _expiresIn = expiryDate;
    notifyListeners();

    return true;
  }
}
