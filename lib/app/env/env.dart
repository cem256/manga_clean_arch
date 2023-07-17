import 'package:envied/envied.dart';

part 'env.g.dart';

/// Reads the .env file from env/.env and generates the Env class
@Envied(path: 'env/.env', obfuscate: true)
abstract final class Env {
  @EnviedField(varName: 'BASE_URL')
  static final String baseUrl = _Env.baseUrl;
}
