import '../models/project_model.dart';
import 'base_repository.dart';
import '../supabase/supabase_client.dart';

class ProjectRepository implements BaseRepository<ProjectModel> {
  final String _table = 'projects';

  @override
  Future<List<ProjectModel>> getAll() async {
    final response = await supabase.from(_table).select();
    return response.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Future<ProjectModel?> getById(dynamic id) async {
    final response = await supabase.from(_table).select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return ProjectModel.fromJson(response);
  }

  @override
  Future<ProjectModel?> add(ProjectModel item) async {
    final response = await supabase.from(_table).insert(item.toJson()).select().maybeSingle();
    if (response == null) return null;
    return ProjectModel.fromJson(response);
  }

  @override
  Future<bool> updateItem(dynamic id, ProjectModel item) async {
    final data = item.toJson();
    data.remove('id'); // Don't update the primary key
    final response = await supabase.from(_table).update(data).eq('id', id).select();
    return response.isNotEmpty;
  }

  @override
  Future<bool> deleteItem(dynamic id) async {
    final response = await supabase.from(_table).delete().eq('id', id).select();
    return response.isNotEmpty;
  }

  Future<List<ProjectModel>> getByStatus(String status) async {
    final response = await supabase.from(_table).select().eq('status', status);
    return response.map((json) => ProjectModel.fromJson(json)).toList();
  }
}
