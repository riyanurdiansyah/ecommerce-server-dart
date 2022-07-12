import 'dart:typed_data';

import 'package:supabase/supabase.dart';

abstract class ProductDataSource {
  const ProductDataSource();

  Future<PostgrestResponse<dynamic>?> getProducts();

  Future<StorageResponse?> uploadImageProduct(
      List<Map<String, dynamic>> listParam, Uint8List image, String id);
}
