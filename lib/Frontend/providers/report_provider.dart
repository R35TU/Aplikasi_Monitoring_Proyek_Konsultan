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
      final report = ReportModel(
        projectId: projectId,
        statusPersetujuan: 'submitted',
        createdAt: DateTime.parse(tanggal),
        deskripsi: deskripsi,
      );
      await _repository.add(report);
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
