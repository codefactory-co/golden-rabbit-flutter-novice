import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class AuthRepository {
  final _dio = Dio();
  final _targetUrl = 'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/auth';

  Future<({String refreshToken, String accessToken})> register({
    required String email,
    required String password,
  }) async {
    final result = await _dio.post(
      '$_targetUrl/register/email',
      data: {
        'email': email,
        'password': password,
      },
    );

    return (refreshToken: result.data['refreshToken'] as String, accessToken: result.data['accessToken'] as String);
  }

  Future<({String refreshToken, String accessToken})> login({
    required String email,
    required String password,
  }) async {
    final emailAndPassword = '$email:$password';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encoded = stringToBase64.encode(emailAndPassword);

    final result = await _dio.post(
      '$_targetUrl/login/email',
      options: Options(
        headers: {
          'authorization': 'Basic $encoded',
        },
      )
    );

    return (refreshToken: result.data['refreshToken'] as String, accessToken: result.data['accessToken'] as String);
  }

  Future<String> rotateRefreshToken({
    required String refreshToken,
  }) async {
    // Refresh Token을 Header에 담아서 Refresh Token 재발급 URL에 요청을 보냅니다.
    final result = await _dio.post(
      '$_targetUrl/token/refresh',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        )
    );

    return result.data['refreshToken'] as String;
  }

  Future<String> rotateAccessToken({
    required String refreshToken,
  }) async {
    // Refresh Token을 Header에 담아서 Access Token 재발급 URL에 요청을 보냅니다.
    final result = await _dio.post(
      '$_targetUrl/token/access',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        )
    );

    return result.data['accessToken'] as String;
  }
}
