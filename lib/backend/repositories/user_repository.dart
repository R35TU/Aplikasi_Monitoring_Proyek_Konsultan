import '../models/user_model.dart';
import 'base_repository.dart';
import '../supabase/supabase_client.dart';

class UserRepository implements BaseRepository<UserModel> {
  final String _table = 'users';

  @override
  Future<List<UserModel>> getAll() async {
    final response = await supabase.from(_table).select();
    // We don't have the auth email in the users table directly without a join or querying auth.users, 
    // assuming email is fetched from auth session when needed or we just pass empty string.
    return response.map((json) => UserModel.fromJson(json, '')).toList();
  }

  @override
  Future<UserModel?> getById(dynamic id) async {
    final response = await supabase.from(_table).select().eq('firebase_uid', id).maybeSingle();
    if (response == null) return null;
    return UserModel.fromJson(response, '');
  }

  @override
  Future<UserModel?> add(UserModel item) async {
    final response = await supabase.from(_table).insert(item.toJson()).select().maybeSingle();
    if (response == null) return null;
    return UserModel.fromJson(response, item.email);
  }

  @override
  Future<bool> updateItem(dynamic id, UserModel item) async {
    final data = item.toJson();
    data.remove('firebase_uid');
    final response = await supabase.from(_table).update(data).eq('firebase_uid', id).select();
    return response.isNotEmpty;
  }

  @override
  Future<bool> deleteItem(dynamic id) async {
    final response = await supabase.from(_table).delete().eq('firebase_uid', id).select();
    return response.isNotEmpty;
  }
}
