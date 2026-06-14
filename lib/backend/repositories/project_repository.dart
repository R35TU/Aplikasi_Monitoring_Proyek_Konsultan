import '../models/project_model.dart';
import 'base_repository.dart';

class ProjectRepository extends BaseRepository {
  ProjectRepository(super.supabase);

  // Fungsi ambil semua proyek dari Supabase
  Future<List<ProjectModel>> ambilSemuaProyek() async {
    final response = await supabase.from('projects').select();
    return response.map((e) => ProjectModel.fromJson(e)).toList();
  }

  /// Menambahkan proyek baru beserta relasi perusahaannya.
  /// Fungsi utama ini hanya bertanggung jawab untuk menyimpan data proyek.
  /// Urusan pembuatan/pengecekan perusahaan dipisah ke fungsi private di bawah.
  Future<void> tambahProyek(Map<String, dynamic> entry) async {
    final namaPerusahaan = entry.remove('nama_perusahaan') as String;
    
    // Panggil fungsi spesifik untuk menangani urusan perusahaan
    final perusahaanId = await _dapatkanAtauBuatPerusahaanId(namaPerusahaan);

    // Assign relasi dan simpan proyek
    entry['perusahaan_id'] = perusahaanId;
    await supabase.from('projects').insert(entry);
  }

  /// 1. Creational Pattern (Pola Pembuatan)Fokus pada mekanisme pembuatan objek agar kode lebih fleksibel dan terkontrol.Singleton: Memastikan kelas hanya memiliki satu instance dan menyediakan titik akses global.Factory Method: Mengabstraksi proses pembuatan objek, membiarkan subclass menentukan kelas mana yang diinstansiasi.Abstract Factory: Membuat keluarga objek terkait tanpa menentukan kelas konkretnya.Builder: Memisahkan konstruksi objek kompleks dari representasinya.Prototype: Membuat objek baru dengan menyalin objek yang sudah ada (cloning).2. Structural Pattern (Pola Struktural)Fokus pada bagaimana kelas dan objek digabungkan menjadi struktur yang lebih besar dan efisien.Adapter: Menjembatani dua antarmuka (interface) yang tidak kompatibel agar bisa bekerja sama.Decorator: Menambahkan fungsionalitas baru ke objek secara dinamis tanpa mengubah kode aslinya.Facade: Menyediakan antarmuka yang disederhanakan ke library, framework, atau sekumpulan kelas yang kompleks.Composite: Menyusun objek ke dalam struktur pohon sehingga klien dapat memperlakukan objek individu dan komposisi secara seragam.Proxy: Menyediakan pengganti atau perwakilan untuk objek lain guna mengontrol akses ke objek tersebut.Bridge: Memisahkan abstraksi dari implementasinya sehingga keduanya dapat diubah secara independen.Flyweight: Menggunakan berbagi data (sharing) untuk mendukung objek dengan jumlah besar secara efisien.3. Behavioral Pattern (Pola Perilaku)Fokus pada cara objek berkomunikasi, berkolaborasi, dan membagi tanggung jawab.Observer: Membuat mekanisme langganan satu ke banyak (one-to-many) agar perubahan pada satu objek otomatis memberitahu objek lain.Strategy: Memungkinkan algoritme dipertukarkan saat program berjalan (runtime).Command: Mengubah permintaan menjadi objek yang berdiri sendiri, memungkinkan antrean, log, atau undo.State: Memungkinkan objek mengubah perilakunya ketika keadaan internalnya berubah.Chain of Responsibility: Meneruskan permintaan di sepanjang rantai objek handler sampai ada yang menanganinya.Iterator: Mengakses elemen dari koleksi objek secara berurutan tanpa mengekspos representasi dasarnya.Mediator: Mengurangi komunikasi langsung antar objek dengan mengenalkannya pada objek perantara (mediator).Memento: Menyimpan dan memulihkan keadaan (state) internal objek tanpa melanggar enkapsulasi.Template Method: Mendefinisikan kerangka algoritma di superclass dan menyerahkan langkah detailnya ke subclass.Visitor: Memisahkan algoritma dari struktur objek tempat algoritma tersebut beroperasi.[Clean Code - Extracted Method] 
  /// Fungsi private (hanya bisa diakses class ini) khusus untuk 
  /// mencari ID Perusahaan atau membuatnya jika belum ada.
  Future<int> _dapatkanAtauBuatPerusahaanId(String namaPerusahaan) async {
    try {
      final existingPerusahaan = await supabase
          .from('perusahaan')
          .select('perusahaan_id')
          .ilike('nama_perusahaan', namaPerusahaan)
          .maybeSingle();

      if (existingPerusahaan != null) {
        return existingPerusahaan['perusahaan_id'] as int;
      }

      final inserted = await supabase
          .from('perusahaan')
          .insert({'nama_perusahaan': namaPerusahaan})
          .select('perusahaan_id')
          .single();
          
      return inserted['perusahaan_id'] as int;
    } catch (e) {
      print('Gagal mengecek/membuat perusahaan: $e');
      throw Exception('Gagal menyimpan data perusahaan: $e');
    }
  }
}
