import 'package:flutter/material.dart';
import '../../backend/models/report_model.dart';
import '../../backend/repositories/report_repository.dart';

enum ReportWorkflowState { draft, submitted, approved, rejected }

class ReportProvider extends ChangeNotifier {
  final ReportRepository reportRepository;

  ReportWorkflowState _state = ReportWorkflowState.draft;
  List<ReportModel> _reports = [];
  bool _isLoading = false;

  ReportProvider(this.reportRepository);

  ReportWorkflowState get state => _state;
  List<ReportModel> get reports => _reports;
  bool get isLoading => _isLoading;

  Future<void> loadReportsForProject(int projectId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _reports = await reportRepository.getByProjectId(projectId);
    } catch (e) {
      debugPrint('ReportProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> submitReport(int reportId) async {
    // PRECONDITION: State must be draft to submit
    final report = _reports.firstWhere((r) => r.id == reportId);
    assert(report.status == 'draft', 'submit() hanya valid dari status draft, saat ini: ${report.status}');

    await reportRepository.updateStatus(reportId, 'submitted');
    await loadReportsForProject(report.projectId);
  }

  Future<void> approveReport(int reportId) async {
    // PRECONDITION: State must be submitted to approve
    final report = _reports.firstWhere((r) => r.id == reportId);
    assert(report.status == 'submitted', 'approve() hanya valid dari status submitted, saat ini: ${report.status}');

    await reportRepository.updateStatus(reportId, 'approved');
    await loadReportsForProject(report.projectId);
  }

  Future<void> rejectReport(int reportId, String reason) async {
    // PRECONDITION: State must be submitted to reject
    final report = _reports.firstWhere((r) => r.id == reportId);
    assert(report.status == 'submitted', 'reject() hanya valid dari status submitted, saat ini: ${report.status}');

    await reportRepository.updateStatus(reportId, 'rejected', catatan: reason);
    await loadReportsForProject(report.projectId);
  }

  Future<void> reviseReport(int reportId) async {
    // PRECONDITION: State must be rejected to revise
    final report = _reports.firstWhere((r) => r.id == reportId);
    assert(report.status == 'rejected', 'revise() hanya valid dari status rejected, saat ini: ${report.status}');

    await reportRepository.updateStatus(reportId, 'draft');
    await loadReportsForProject(report.projectId);
  }

  Future<void> createReport(ReportModel report) async {
    await reportRepository.add(report);
    await loadReportsForProject(report.projectId);
  }
}
