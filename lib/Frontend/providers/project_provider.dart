import 'package:flutter/material.dart';
import 'package:my_app/backend/repositories/project_repository.dart';
import 'package:my_app/backend/models/project_model.dart';

enum ProjectState { initial, loading, loaded, error }

class ProjectProvider extends ChangeNotifier {
  final ProjectRepository _repository;

  ProjectProvider(this._repository);

  ProjectState _state = ProjectState.initial;
  ProjectState get state => _state;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<ProjectModel> _projects = [];
  List<ProjectModel> get projects => _projects;

  Future<void> loadProjects() async {
    _setState(ProjectState.loading);
    try {
      _projects = await _repository.getAll();
      _setState(ProjectState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ProjectState.error);
    }
  }

  Future<bool> addProject(String namaProyek, String lokasi, String status) async {
    _setState(ProjectState.loading);
    try {
      final project = ProjectModel(
        title: namaProyek,
        location: lokasi,
        status: status,
        progressRencana: 0,
        progressAktual: 0,
        imagePath: '',
      );
      
      await _repository.add(project);
      await loadProjects(); // reload after insert
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ProjectState.error);
      return false;
    }
  }

  Future<bool> deleteProject(int id) async {
    _setState(ProjectState.loading);
    try {
      await _repository.deleteItem(id);
      await loadProjects();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ProjectState.error);
      return false;
    }
  }

  void _setState(ProjectState state) {
    _state = state;
    notifyListeners();
  }
}
