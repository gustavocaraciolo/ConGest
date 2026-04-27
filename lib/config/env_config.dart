import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'https://www2.siaf.co.ao';
  static String get authBaseUrl => dotenv.env['AUTH_BASE_URL'] ?? 'https://www2.siaf.co.ao/token';
  static String get authBasicToken => dotenv.env['AUTH_BASIC_TOKEN'] ?? '';
  static String get authScope => dotenv.env['AUTH_SCOPE'] ?? '';
  static String get originUrl => dotenv.env['ORIGIN_URL'] ?? 'https://www1.siaf.co.ao';
  static String get refererUrl => dotenv.env['REFERER_URL'] ?? 'https://www1.siaf.co.ao/';
}
