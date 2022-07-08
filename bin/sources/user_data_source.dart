import 'package:supabase/supabase.dart';

abstract class UserDataSource {
  Future<PostgrestResponse<dynamic>?> getUsers();

  Future<PostgrestResponse<dynamic>?> getUserById(String id);

  // Future<PostgrestResponse<dynamic>?> addUser(UserM user);

  Future<PostgrestResponse<dynamic>?> getCategories();
}
