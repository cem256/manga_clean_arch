import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get fileName => 'env/.env';
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'BASE_URL NOT FOUND';
}
