import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../models/response_m.dart';
import '../repositories/categori_repository.dart';
import '../utils/app_response.dart';

class CategoryController {
  static fnGetCategories(Request request) async {
    final response = await CategoryRepository().getCategories();
    if (response!.data != null) {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: 200,
            message: 'Success',
            data: response.data,
          ),
        ),
      );
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: response.error!.message,
            data: [],
          ),
        ),
      );
    }
  }

  static fnGetCategoryById(Request request, String id) async {
    final response = await CategoryRepository().getCategoriById(id);
    if (response!.data != null) {
      if (response.data.isNotEmpty) {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Success',
              data: response.data[0],
            ),
          ),
        );
      } else {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Data tidak ditemukan',
              data: {},
            ),
          ),
        );
      }
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: response.error!.message,
            data: {},
          ),
        ),
      );
    }
  }

  static fnGetSubCategory(Request request) async {
    final response = await CategoryRepository().getSubCategories();
    if (response!.data != null) {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: 200,
            message: 'Success',
            data: response.data,
          ),
        ),
      );
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: response.error!.message,
            data: [],
          ),
        ),
      );
    }
  }

  static fnGetSubCategoryById(Request request, String id) async {
    final response = await CategoryRepository().getSubCategoriById(id);
    if (response!.data != null) {
      if (response.data.isNotEmpty) {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Success',
              data: response.data[0],
            ),
          ),
        );
      } else {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Data tidak ditemukan',
              data: {},
            ),
          ),
        );
      }
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: "response.error!.message",
            data: {},
          ),
        ),
      );
    }
  }

  static fnGetUndersubCategory(Request request) async {
    final response = await CategoryRepository().getUndersubCategories();
    if (response!.data != null) {
      return AppResponse.response(
          response.status!,
          jsonEncode(
              ResponseM(status: 200, message: 'Success', data: response.data)));
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: response.error!.message,
            data: [],
          ),
        ),
      );
    }
  }

  static fnGetUndersubCategoryById(Request request, String id) async {
    final response = await CategoryRepository().getUndersubCategoriById(id);
    if (response!.data != null) {
      if (response.data.isNotEmpty) {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Success',
              data: response.data[0],
            ),
          ),
        );
      } else {
        return AppResponse.response(
          response.status!,
          jsonEncode(
            ResponseM(
              status: 200,
              message: 'Data tidak ditemukan',
              data: {},
            ),
          ),
        );
      }
    } else {
      return AppResponse.response(
        response.status!,
        jsonEncode(
          ResponseM(
            status: response.status!,
            message: response.error!.message,
            data: {},
          ),
        ),
      );
    }
  }
}
