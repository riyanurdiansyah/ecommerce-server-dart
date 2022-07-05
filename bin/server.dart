import 'dart:io';

import 'package:args/args.dart';
import 'package:shelf/shelf.dart';

import 'package:shelf/shelf_io.dart' as io;

import 'routes/app_route.dart';

var portEnv = Platform.environment['PORT'];
var hostname = portEnv == null ? 'localhost' : '0.0.0.0';

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = result['port'] ?? portEnv ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(AppRoute().routes);

  var server = await io.serve(handler, hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
