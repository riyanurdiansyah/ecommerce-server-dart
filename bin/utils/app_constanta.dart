import 'package:supabase/supabase.dart';

import '../config/config.dart';

final db = SupabaseClient(Env.supabaseUrl, Env.supabaseKey);

const defaultHeader = {
  'Application': 'application/json',
  'Content-Type': 'application/json',
};

const baseUrl = '/api/v1';
