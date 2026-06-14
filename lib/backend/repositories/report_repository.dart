import 'base_repository.dart';

class ReportRepository extends BaseRepository {
  ReportRepository(super.supabase);

  // Fungsi menyimpan form laporan harian dan mengembalikan reports_id
  Future<int> tambahLaporan(Map<String, dynamic> entry) async {
    final result = await supabase.from('reports').insert(entry).select('reports_id').single();
    return result['reports_id'] as int;
  }

  // Fungsi menyimpan daftar material untuk suatu laporan
  Future<void> tambahMaterialLaporan(List<Map<String, dynamic>> materials) async {
    if (materials.isEmpty) return;
    await supabase.from('report_materials').insert(materials);
  }

  // Fungsi sakti untuk menghitung sudah berapa hari laporan diisi
  Future<int> hitungTotalHariLaporan(int projectId) async {
    final response = await supabase.from('reports').select().eq('proyek_id', projectId);
    return response.length;
  }

  // Mengambil semua laporan
  Future<List<Map<String, dynamic>>> ambilSemuaLaporan() async {
    return await supabase.from('reports').select();
  }

  // Mengambil laporan berdasarkan id proyek
  Future<List<Map<String, dynamic>>> ambilLaporanBerdasarkanProyek(int projectId) async {
    return await supabase.from('reports').select().eq('proyek_id', projectId).order('tanggal', ascending: false);
  }
}
