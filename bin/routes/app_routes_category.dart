import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/category_c.dart';
import '../controllers/product_c.dart';

class AppRouteCategory {
  Handler get router {
    final route = Router();
    route.get('/', CategoryController.fnGetCategories);
    route.get('/sub', CategoryController.fnGetSubCategory);
    route.get('/undersub', CategoryController.fnGetUndersubCategory);
    route.post('/uploadimg', ProductController.fnPostUploadImageProduct);
    route.get('/<id>', CategoryController.fnGetCategoryById);
    route.get('/sub/<id>', CategoryController.fnGetSubCategoryById);
    route.get('/undersub/<id>', CategoryController.fnGetUndersubCategoryById);
    final handler = Pipeline().addHandler(route);
    return handler;
  }
}
