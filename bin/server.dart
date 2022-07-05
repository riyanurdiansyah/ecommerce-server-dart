import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'config/config.dart';
import 'routes/app_route.dart';
import 'utils/app_middleware.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(AppMiddleware().handleCors())
      .addMiddleware(AppMiddleware().handleAuth(Env.jwtSecretKey))
      .addHandler(AppRoute().routes);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('SERVER START ${ip.address} ON PORT ${server.port}');
}
