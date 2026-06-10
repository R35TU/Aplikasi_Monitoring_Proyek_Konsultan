import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/backend/models/project_model.dart';

void main() {
  group('Performance Benchmark - Model Parsing and Filtering', () {
    test('Mengukur kecepatan parse 1000 JSON ke ProjectModel', () {
      final jsonSample = {
        'id': '1',
        'nama_proyek': 'Pembangunan Jembatan Baru',
        'perusahaan_id': 10,
        'pemilik_proyek': 'Pemerintah',
        'sumber_dana': 'APBD',
        'lokasi': 'Cilacap',
        'gambar_url': 'assets/images/jembatan.png',
        'tanggal_mulai': '2026-01-01',
        'target_selesai': '2026-12-31',
        'progress_rencana': 50,
        'progress_aktual': 45,
        'status': 'Berjalan'
      };

      // Buat data sampel 1000 buah
      final List<Map<String, dynamic>> rawJsonList = List.generate(1000, (index) => {
        ...jsonSample,
        'id': index,
        'nama_proyek': 'Pembangunan Jembatan ke-$index',
      });

      final stopwatch = Stopwatch()..start();

      // Eksekusi operasi bulk parsing
      final List<ProjectModel> projects = rawJsonList.map((json) => ProjectModel.fromJson(json)).toList();

      stopwatch.stop();

      print('Waktu eksekusi parse 1000 data: ${stopwatch.elapsedMilliseconds} ms');
      
      // Assertion: Kecepatan parse 1000 data harus di bawah 100 ms
      expect(stopwatch.elapsedMilliseconds, lessThan(100), reason: 'Parsing 1000 data harus sangat cepat (< 100ms)');
      expect(projects.length, 1000);
    });

    test('Mengukur kecepatan filter data pada list berkapasitas 5000 item', () {
      final List<ProjectModel> bigList = List.generate(5000, (index) {
        return ProjectModel(
          id: index,
          title: 'Proyek $index',
          location: index % 2 == 0 ? 'Purwokerto' : 'Purbalingga',
          status: index % 5 == 0 ? 'Selesai' : 'Berjalan',
          progressRencana: 50,
          progressAktual: 40,
          imagePath: '',
        );
      });

      final stopwatch = Stopwatch()..start();

      // Lakukan pencarian dan filter list
      final filtered = bigList.where((p) => p.location == 'Purwokerto' && p.status == 'Selesai').toList();

      stopwatch.stop();

      print('Waktu eksekusi filter 5000 data: ${stopwatch.elapsedMilliseconds} ms');

      // Assertion: Filter data lokal 5000 item harus di bawah 50 ms
      expect(stopwatch.elapsedMilliseconds, lessThan(50), reason: 'Filter 5000 data harus < 50ms');
      expect(filtered.length, 500); // 5000 / 2 (Purwokerto) / 5 (Selesai) = 500
    });
  });
}
