import 'package:flutter/material.dart';
import '../../backend/models/report_model.dart';
import '../../backend/repositories/report_repository.dart';

enum ReportFetchState { initial, loading, loaded, error }

class ReportProvider extends ChangeNotifier {
  final ReportRepository _repository;

  ReportProvider(this._repository);

  ReportFetchState _state = ReportFetchState.initial;
  ReportFetchState get state => _state;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<ReportModel> _reports = [];
  List<ReportModel> get reports => _reports;

  Future<void> loadReports() async {
    _setState(ReportFetchState.loading);
    try {
      final data = await _repository.ambilSemuaLaporan();
      _reports = data.map((e) => ReportModel(
        reportsId: e['reports_id'] ?? 0,
        proyekId: e['proyek_id'] ?? 0,
        pembuatId: e['pembuat_id'] ?? '',
        penyatujuId: e['penyatuju_id'],
        jenisLaporan: e['jenis_laporan'] ?? 'Pengawasan',
        tanggal: e['tanggal'] ?? '',
        cuaca: e['cuaca'],
        jumlahPekerja: e['jumlah_pekerja'],
        deskripsi: e['deskripsi'],
        statusPersetujuan: e['status_persetujuan'] ?? 'Pending',
      )).toList();
      _setState(ReportFetchState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
    }
  }

  Future<void> loadReportsByProject(int projectId) async {
    _setState(ReportFetchState.loading);
    try {
      final data = await _repository.ambilLaporanBerdasarkanProyek(projectId);
      _reports = data.map((e) => ReportModel(
        reportsId: e['reports_id'] ?? 0,
        proyekId: e['proyek_id'] ?? 0,
        pembuatId: e['pembuat_id'] ?? '',
        penyatujuId: e['penyatuju_id'],
        jenisLaporan: e['jenis_laporan'] ?? 'Pengawasan',
        tanggal: e['tanggal'] ?? '',
        cuaca: e['cuaca'],
        jumlahPekerja: e['jumlah_pekerja'],
        deskripsi: e['deskripsi'],
        statusPersetujuan: e['status_persetujuan'] ?? 'Pending',
      )).toList();
      _setState(ReportFetchState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
    }
  }

  Future<bool> submitReport(int projectId, String deskripsi, int progress, String tanggal) async {
    _setState(ReportFetchState.loading);
    try {
      final reportData = {
        'proyek_id': projectId,
        'status_persetujuan': 'submitted',
        'tanggal': DateTime.parse(tanggal).toIso8601String(),
        'deskripsi': deskripsi,
        'pembuat_id': '00000000-0000-0000-0000-000000000000', // Default atau ambil dari auth
        'jenis_laporan': 'Pengawasan',
      };
      await _repository.tambahLaporan(reportData);
      await loadReports();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
      return false;
    }
  }

  Future<bool> deleteReport(int id) async {
    _setState(ReportFetchState.loading);
    try {
      // await _repository.hapusLaporan(id); // Implement hapusLaporan di repo jika dibutuhkan
      await loadReports();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
      return false;
    }
  }

  void _setState(ReportFetchState state) {
    _state = state;
    notifyListeners();
  }
}
