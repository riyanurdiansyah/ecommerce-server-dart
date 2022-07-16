import 'dart:io';

import 'package:shelf/shelf.dart';

import 'package:shelf/shelf_io.dart' as io;

import 'config/config.dart';
import 'routes/app_route.dart';
import 'utils/app_middleware.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(AppMiddleware().handleCors())
      .addMiddleware(AppMiddleware().handleAuth(Env.jwtSecretKey))
      .addHandler(AppRoute().routes);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  var server = await io.serve(handler, ip, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
