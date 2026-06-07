import 'package:flutter/material.dart';
import '../../backend/models/project_model.dart';
import '../../backend/repositories/project_repository.dart';

class ProjectProvider extends ChangeNotifier {
  final ProjectRepository projectRepository;

  List<ProjectModel> _projects = [];
  bool _isLoading = false;

  ProjectProvider(this.projectRepository);

  List<ProjectModel> get projects => _projects;
  bool get isLoading => _isLoading;

  Future<void> loadProjects() async {
    _isLoading = true;
    notifyListeners();
    try {
      _projects = await projectRepository.getAll();
    } catch (e) {
      debugPrint('ProjectProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createProject(ProjectModel project) async {
    await projectRepository.add(project);
    await loadProjects();
  }

  Future<void> updateProject(int id, ProjectModel project) async {
    await projectRepository.update(id, project);
    await loadProjects();
  }

  Future<void> deleteProject(int id) async {
    await projectRepository.delete(id);
    await loadProjects();
  }
}
