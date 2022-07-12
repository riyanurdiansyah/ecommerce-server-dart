import 'dart:convert';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';
import 'package:shelf_multipart/form_data.dart';

import '../models/response_m.dart';
import '../repositories/product_repository.dart';
import '../utils/app_response.dart';

class ProductController {
  static fnGetProducts(Request request) async {
    final response = await ProductRepository().getProducts();
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

  static fnPostUploadImageProduct(Request request, String id) async {
    List<Map<String, dynamic>>? listParam = [];
    Uint8List? image;
    if (request.isMultipartForm) {
      await for (final formData in request.multipartFormData) {
        image = await formData.part.readBytes();
        listParam.add(
          {
            formData.name: formData.filename ?? '',
          },
        );
      }
      final response =
          await ProductRepository().uploadImageProduct(listParam, image!, id);
      if (response != null) {
        if (response.hasError) {
          return AppResponse.response(
            403,
            jsonEncode(
              {
                'status': 403,
                'message': response.error!.message,
              },
            ),
          );
        } else {
          return AppResponse.response(
            200,
            jsonEncode(
              ResponseM(
                status: 200,
                message: 'Upload image is successfull',
                data: {},
              ),
            ),
          );
        }
      } else {
        return AppResponse.response(
          403,
          jsonEncode(
            {
              'status': 403,
              'message': response!.error!.message,
            },
          ),
        );
      }
    } else {
      return AppResponse.response(
        403,
        jsonEncode(
          {
            'status': 403,
            'message': 'Image not found',
          },
        ),
      );
    }
  }
}
