import '../models/report_model.dart';
import 'base_repository.dart';
import '../supabase/supabase_client.dart';

class ReportRepository implements BaseRepository<ReportModel> {
  final String _table = 'reports';

  @override
  Future<List<ReportModel>> getAll() async {
    final response = await supabase.from(_table).select();
    return response.map((json) => ReportModel.fromJson(json)).toList();
  }

  @override
  Future<ReportModel?> getById(dynamic id) async {
    final response = await supabase.from(_table).select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return ReportModel.fromJson(response);
  }

  Future<List<ReportModel>> getByProjectId(int projectId) async {
    final response = await supabase.from(_table).select().eq('proyek_id', projectId);
    return response.map((json) => ReportModel.fromJson(json)).toList();
  }

  @override
  Future<ReportModel?> add(ReportModel item) async {
    final response = await supabase.from(_table).insert(item.toJson()).select().maybeSingle();
    if (response == null) return null;
    return ReportModel.fromJson(response);
  }

  @override
  Future<bool> updateItem(dynamic id, ReportModel item) async {
    final data = item.toJson();
    data.remove('id');
    final response = await supabase.from(_table).update(data).eq('id', id).select();
    return response.isNotEmpty;
  }

  @override
  Future<bool> deleteItem(dynamic id) async {
    final response = await supabase.from(_table).delete().eq('id', id).select();
    return response.isNotEmpty;
  }
}
