import 'package:supabase/supabase.dart';

abstract class CategoryDataSource {
  const CategoryDataSource();

  Future<PostgrestResponse<dynamic>?> getCategories();

  Future<PostgrestResponse<dynamic>?> getCategoriById(String id);

  Future<PostgrestResponse<dynamic>?> getSubCategories();

  Future<PostgrestResponse<dynamic>?> getSubCategoriById(String id);

  Future<PostgrestResponse<dynamic>?> getUndersubCategories();

  Future<PostgrestResponse<dynamic>?> getUndersubCategoriById(String id);
}
