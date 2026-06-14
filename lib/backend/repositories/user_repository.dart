import '../models/user_model.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.supabase);

  Future<List<UserModel>> getAll() async {
    final response = await supabase.from('users').select();
    return [];
  }

  Future<UserModel?> getById(String id) async {
    final response = await supabase
        .from('users')
        .select()
        .eq('user_id', id)
        .maybeSingle();
    return null;
  }

  Future<UserModel?> getByEmail(String email) async {
    final response = await supabase
        .from('users')
        .select()
        .eq('email', email)
        .maybeSingle();
    return null;
  }

  Future<void> add(Map<String, dynamic> entry) async {
    await supabase.from('users').insert(entry);
  }

  Future<void> update(String id, Map<String, dynamic> entry) async {
    await supabase.from('users').update(entry).eq('user_id', id);
  }

  Future<void> delete(String id) async {
    await supabase.from('users').delete().eq('user_id', id);
  }
}
