import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class AppJwt {
  dynamic verifyJwt(String token, String secret) {
    try {
      final jwt = JWT.verify(token, SecretKey(secret));
      return jwt;
    } on JWTExpiredError {
      print('JWT IS EXPIRED');
    } on JWTError {
      print('JWT IS ERROR');
    }
  }
}
