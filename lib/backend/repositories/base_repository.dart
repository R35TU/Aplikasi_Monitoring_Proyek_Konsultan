import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseRepository {
  final SupabaseClient supabase;
  BaseRepository(this.supabase);
}
