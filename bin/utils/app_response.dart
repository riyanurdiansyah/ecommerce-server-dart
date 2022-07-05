import 'package:shelf/shelf.dart';

import 'app_constanta.dart';

class AppResponse {
  static response(int status, dynamic data) {
    switch (status) {
      case 200:
        return Response.ok(
          data,
          headers: defaultHeader,
        );
      case 401:
        return Response.notAuthorized(
          data,
          headers: defaultHeader,
        );
      case 403:
        return Response.forbidden(
          data,
          headers: defaultHeader,
        );
      case 404:
        return Response.notFound(
          data,
          headers: defaultHeader,
        );
      case 500:
        return Response.internalServerError(
          body: data,
          headers: defaultHeader,
        );
      default:
        return Response.internalServerError(
          body: data,
          headers: defaultHeader,
        );
    }
  }
}
