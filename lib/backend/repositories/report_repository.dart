import 'base_repository.dart';

class ReportRepository extends BaseRepository {
  ReportRepository(super.supabase);

  // Fungsi menyimpan form laporan harian
  Future<void> tambahLaporan(Map<String, dynamic> entry) async {
    await supabase.from('reports').insert(entry);
  }

  // Fungsi sakti untuk menghitung sudah berapa hari laporan diisi
  Future<int> hitungTotalHariLaporan(int projectId) async {
    final response = await supabase.from('reports').select().eq('proyek_id', projectId);
    return response.length;
  }
}
