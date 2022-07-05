import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../utils/app_constanta.dart';
import 'app_route_auth.dart';

class AppRoute {
  Handler get routes {
    final app = Router();
    app.mount('$baseUrl/auth', AppRouteAuth().router);
    app.get('/', echoRequest);
    return app;
  }

  static fnHome(Request request) async {
    return Response.ok('Server berhasil start');
  }

  Response echoRequest(Request request) => Response.ok('Server berhasil start');
}
