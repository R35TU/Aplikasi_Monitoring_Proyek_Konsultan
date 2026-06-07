// =============================================================
// FILE   : lib/Frontend/providers/dashboard_provider.dart
// TEKNIK : State Management
// =============================================================

import 'package:flutter/material.dart';
import '../../backend/repositories/project_repository.dart';
import '../../backend/database/app_database.dart';

class DashboardProvider extends ChangeNotifier {
  final ProjectRepository _projectRepository;

  bool isLoading = false;
  List<Project> projects = [];
  int totalProjects = 0;
  int completedProjects = 0;
  int onProgressProjects = 0;

  DashboardProvider(this._projectRepository);

  Future<void> loadDashboardData() async {
    isLoading = true;
    notifyListeners();

    try {
      projects = await _projectRepository.getAll();
      totalProjects = projects.length;
      
      completedProjects = projects.where((p) => p.status.toLowerCase() == 'selesai').length;
      onProgressProjects = projects.where((p) => p.status.toLowerCase() == 'berjalan').length;
      
    } catch (e) {
      print("Error loading dashboard data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}