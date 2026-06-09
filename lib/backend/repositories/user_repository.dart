import '../models/user_model.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.supabase);

  Future<List<UserModel>> getAll() async {
    final response = await supabase.from('users').select();
    return [];
  }

  Future<UserModel?> getById(int id) async {
    final response = await supabase.from('users').select().eq('id', id).maybeSingle();
    return null;
  }

  Future<UserModel?> getByEmail(String email) async {
    final response = await supabase.from('users').select().eq('email', email).maybeSingle();
    return null;
  }

  Future<void> add(Map<String, dynamic> entry) async {
    await supabase.from('users').insert(entry);
  }

  Future<void> update(int id, Map<String, dynamic> entry) async {
    await supabase.from('users').update(entry).eq('id', id);
  }

  Future<void> delete(int id) async {
    await supabase.from('users').delete().eq('id', id);
  }
}
