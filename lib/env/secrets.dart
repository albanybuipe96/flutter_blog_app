import 'package:envied/envied.dart';

part 'secrets.g.dart';

@Envied(obfuscate: true)
class Secrets {
  const Secrets._();

  @EnviedField()
  static String SUPABASE_URL = _Secrets.SUPABASE_URL;

  @EnviedField()
  static String SUPABASE_ANON_KEY = _Secrets.SUPABASE_ANON_KEY;

  @EnviedField()
  static String SUPABASE_DB_PASSWORD = _Secrets.SUPABASE_DB_PASSWORD;
}
