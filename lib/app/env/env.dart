import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'env/.env', obfuscate: true)
abstract final class Env {
  @EnviedField(varName: 'BASE_URL')
  static final baseUrl = _Env.baseUrl;
}
