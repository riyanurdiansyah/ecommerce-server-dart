import 'dart:typed_data';

import 'package:postgrest/src/postgrest_response.dart';
import 'package:storage_client/src/types.dart';

import '../sources/product_data_source.dart';

class ProductRepository extends ProductDataSource {
  @override
  Future<PostgrestResponse?> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<StorageResponse?> uploadImageProduct(
      List<Map<String, dynamic>> listParam, Uint8List image, String id) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
