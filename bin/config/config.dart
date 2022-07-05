import 'package:envify/envify.dart';
part 'config.g.dart';

@Envify()
abstract class Env {
  static const supabaseUrl = _Env.supabaseUrl;
  static const supabaseKey = _Env.supabaseKey;
  static const jwtSecretKey = _Env.jwtSecretKey;
}
