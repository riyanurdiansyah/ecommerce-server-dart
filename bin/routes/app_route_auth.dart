import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/auth_c.dart';

class AppRouteAuth {
  Handler get router {
    final route = Router();
    route.post('/signin', AuthController.fnPostSignin);
    route.post('/signup', AuthController.fnPostSignup);
    route.post('/signup/phone', AuthController.fnPostSignupWithPhone);
    route.post('/verifyotp', AuthController.fnPostVerifyOTP);
    final handler = Pipeline().addHandler(route);
    return handler;
  }
}
