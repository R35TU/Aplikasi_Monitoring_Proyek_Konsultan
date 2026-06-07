import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../backend/database/app_database.dart';
import '../../backend/repositories/report_repository.dart';

enum ReportFetchState { initial, loading, loaded, error }

class ReportProvider extends ChangeNotifier {
  final ReportRepository _repository;

  ReportProvider(this._repository);

  ReportFetchState _state = ReportFetchState.initial;
  ReportFetchState get state => _state;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Report> _reports = [];
  List<Report> get reports => _reports;

  Future<void> loadReports() async {
    _setState(ReportFetchState.loading);
    try {
      _reports = await _repository.getAll();
      _setState(ReportFetchState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
    }
  }

  Future<void> loadReportsByProject(int projectId) async {
    _setState(ReportFetchState.loading);
    try {
      _reports = await _repository.getByProjectId(projectId);
      _setState(ReportFetchState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ReportFetchState.error);
    }
  }

  Future<bool> submitReport(int projectId, String deskripsi, int progress, String tanggal) async {
    _setState(ReportFetchState.loading);
    try {
      final companion = ReportsCompanion(
        proyekId: drift.Value(projectId),
        deskripsi: drift.Value(deskripsi),
        progress: drift.Value(progress),
        tanggal: drift.Value(tanggal),
        status: const drift.Value('submitted'),
      );
      await _repository.add(companion);
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
      await _repository.deleteItem(id);
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
