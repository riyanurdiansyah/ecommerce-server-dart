import 'package:supabase/supabase.dart';

abstract class FieldRepo {
  FieldRepo();

  Future<PostgrestResponse<dynamic>?> getFields();

  Future<PostgrestResponse<dynamic>?> getFieldById(String id);

  Future<PostgrestResponse<dynamic>?> deleteFieldById(int id);
}
