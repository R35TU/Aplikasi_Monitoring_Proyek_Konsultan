import 'package:flutter/material.dart';
import '../../backend/repositories/project_repository.dart';
import '../../backend/repositories/report_repository.dart';

class DashboardProvider extends ChangeNotifier {
  final ProjectRepository projectRepository;
  final ReportRepository reportRepository;

  int _totalProyek = 0;
  int _proyekBerjalan = 0;
  int _proyekSelesai = 0;
  int _laporanHariIni = 0;
  List<String> _listNamaProyek = [];
  bool _isLoading = false;

  DashboardProvider({
    required this.projectRepository,
    required this.reportRepository,
  });

  int get totalProyek => _totalProyek;
  int get proyekBerjalan => _proyekBerjalan;
  int get proyekSelesai => _proyekSelesai;
  int get laporanHariIni => _laporanHariIni;
  List<String> get listNamaProyek => _listNamaProyek;
  bool get isLoading => _isLoading;

  Future<void> loadDataFromDatabase() async {
    _isLoading = true;
    notifyListeners();

    try {
      final projects = await projectRepository.getAll();
      final reports = await reportRepository.getAll();

      _totalProyek = projects.length;
      _proyekBerjalan = projects.where((p) => p.status == 'Progres' || p.status == 'Berjalan').length;
      _proyekSelesai = projects.where((p) => p.status == 'Selesai').length;
      _listNamaProyek = projects.map((p) => p.title).toList();

      final todayStr = DateTime.now().toIso8601String().substring(0, 10);
      _laporanHariIni = reports.where((r) => r.tanggal.startsWith(todayStr)).length;
    } catch (e) {
      debugPrint('DashboardProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}