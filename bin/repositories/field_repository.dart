import 'package:postgrest/src/postgrest_response.dart';
import 'package:supabase/supabase.dart';
import '../sources/field_data_source.dart';
import '../utils/app_constanta.dart';

class FieldService extends FieldDataSource {
  @override
  Future<PostgrestResponse?> getFieldById(String id) async {
    try {
      return await db
          .from('tb_fields')
          .select('*, tb_field_images!inner(*)')
          .eq('images.field_id', id)
          .execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse?> getFields() async {
    try {
      return await db.from('tb_fields').select(
        '''
          *,
          field_images (
            id,
            image
          )
        ''',
      ).execute();
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }

  @override
  Future<PostgrestResponse?> deleteFieldById(int id) async {
    try {
      final response = await db.from('field_images').delete().match({
        'field_id': id,
      }).execute();
      if (response.data != null) {
        return await db.from('tb_fields').delete().match({
          'id': id,
        }).execute();
      }
      return null;
    } catch (e) {
      print("ERROR : ${e.toString()}");
      return null;
    }
  }
}
