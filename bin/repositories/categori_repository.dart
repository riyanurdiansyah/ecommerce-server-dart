import 'dart:convert';

import 'package:postgrest/src/postgrest_response.dart';
import '../models/response_m.dart';
import '../sources/category_data_source.dart';
import '../utils/app_constanta.dart';
import '../utils/app_response.dart';

class CategoryRepository extends CategoryDataSource {
  @override
  Future<PostgrestResponse?> getCategoriById(String id) async {
    try {
      return await db.from('tb_categories').select('*').eq('id', id).execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: {},
          ),
        ),
      );
    }
  }

  @override
  Future<PostgrestResponse?> getCategories() async {
    try {
      return await db.from('tb_categories').select('*').execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: [],
          ),
        ),
      );
    }
  }

  @override
  Future<PostgrestResponse?> getSubCategoriById(String id) async {
    try {
      return await db
          .from('tb_sub_categories')
          .select('*')
          .eq('id_category', id)
          .execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: {},
          ),
        ),
      );
    }
  }

  @override
  Future<PostgrestResponse?> getSubCategories() async {
    try {
      return await db.from('tb_sub_categories').select('*').execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: [],
          ),
        ),
      );
    }
  }

  @override
  Future<PostgrestResponse?> getUndersubCategoriById(String id) async {
    try {
      return await db
          .from('tb_undersub_categories')
          .select('*')
          .eq('id_sub_category', id)
          .execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: {},
          ),
        ),
      );
    }
  }

  @override
  Future<PostgrestResponse?> getUndersubCategories() async {
    try {
      return await db.from('tb_undersub_categories').select('*').execute();
    } catch (e) {
      return AppResponse.response(
        500,
        jsonEncode(
          ResponseM(
            status: 500,
            message: e.toString(),
            data: [],
          ),
        ),
      );
    }
  }
}
