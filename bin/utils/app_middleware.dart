import 'dart:convert';

import 'package:shelf/shelf.dart';

import 'app_jwt.dart';
import 'app_response.dart';

class AppMiddleware {
  Middleware handleCors() {
    const corsHeader = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
      'Access-Control-Allow-Headers': 'Origin, Content-Type',
    };

    return createMiddleware(requestHandler: (Request request) {
      if (request.method == 'OPTIONS') {
        return Response.ok(
          '',
          headers: corsHeader,
        );
      }
      return null;
    }, responseHandler: (Response response) {
      return response.change(headers: corsHeader);
    });
  }

  Middleware handleAuth(String secret) {
    return (Handler innerHandler) {
      return (Request request) async {
        final authHeader = request.headers['authorization'];
        dynamic token, jwt;

        if (authHeader != null && authHeader.startsWith('Bearer ')) {
          token = authHeader.substring(7);
          jwt = AppJwt().verifyJwt(token, secret);
        }

        final updateRequest = request.change(context: {
          'authDetails': jwt,
        });
        return await innerHandler(updateRequest);
      };
    };
  }

  Middleware checkAuthorization() {
    return createMiddleware(
      requestHandler: (Request request) {
        if (request.context['authDetails'] == null) {
          return AppResponse.response(
            401,
            jsonEncode(
              {
                'status': 401,
                'message': 'You dont have access for this action',
              },
            ),
          );
        }
        return null;
      },
    );
  }
}
