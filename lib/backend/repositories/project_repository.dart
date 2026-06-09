import '../models/project_model.dart';
import 'base_repository.dart';

class ProjectRepository extends BaseRepository {
  ProjectRepository(super.supabase);

  // Fungsi ambil semua proyek dari Supabase
  Future<List<ProjectModel>> ambilSemuaProyek() async {
    final response = await supabase.from('projects').select();
    // Anda bisa menyesuaikan parsing JSON-nya nanti
    // return response.map((e) => ProjectModel.fromJson(e)).toList();
    return []; // Sementara mengembalikan list kosong agar tidak error
  }

  // Fungsi tambah proyek
  Future<void> tambahProyek(Map<String, dynamic> entry) async {
    await supabase.from('projects').insert(entry);
  }
}
