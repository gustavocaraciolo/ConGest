import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/env_config.dart';

class AuthService {
  static String get _baseUrl => EnvConfig.authBaseUrl;
  static String get _basicAuth => EnvConfig.authBasicToken;
  static String get _scope => EnvConfig.authScope;

  static Future<AuthResult> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'Authorization': _basicAuth,
          'Accept': 'application/json, text/plain, */*',
          'Accept-Language': 'pt',
          'Origin': EnvConfig.originUrl,
          'Referer': EnvConfig.refererUrl,
        },
        body: {
          'grant_type': 'password',
          'username': 'SIAF/$username@carbon.super',
          'password': password,
          'scope': _scope,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'] as String;
        final refreshToken = data['refresh_token'] as String?;
        final expiresIn = data['expires_in'] as int? ?? 3600;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);
        if (refreshToken != null) {
          await prefs.setString('refresh_token', refreshToken);
        }
        await prefs.setInt(
          'token_expires_at',
          DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000),
        );

        return AuthResult.success(token);
      } else {
        final error = 'Email ou Palavra-passe inválidos.';
        return AuthResult.failure(error.toString());
      }
    } catch (e) {
      return AuthResult.failure('Erro de ligação. Por favor, tente novamente.');
    }
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final expiresAt = prefs.getInt('token_expires_at') ?? 0;
    if (token == null) return false;
    return DateTime.now().millisecondsSinceEpoch < expiresAt;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
    await prefs.remove('token_expires_at');
  }
}

class AuthResult {
  final bool success;
  final String? token;
  final String? errorMessage;

  AuthResult._({required this.success, this.token, this.errorMessage});

  factory AuthResult.success(String token) =>
      AuthResult._(success: true, token: token);

  factory AuthResult.failure(String message) =>
      AuthResult._(success: false, errorMessage: message);
}
