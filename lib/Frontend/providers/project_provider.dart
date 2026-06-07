import 'package:flutter/material.dart';
import 'package:my_app/backend/database/app_database.dart';
import 'package:my_app/backend/repositories/project_repository.dart';
import 'package:my_app/backend/models/project_model.dart';
import 'package:drift/drift.dart' as drift;

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
      final dbProjects = await _repository.getAll();
      _projects = dbProjects.map((p) => ProjectModel(
        id: p.id,
        title: p.namaProyek,
        location: p.lokasi ?? 'Lokasi Belum Ditentukan',
        status: p.status,
        targetProgress: 1.0, // Mock for now
        actualProgress: p.status == 'Selesai' ? 1.0 : 0.5, // Mock for now
        imagePath: 'assets/images/bottom_bg.png',
      )).toList();
      _setState(ProjectState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ProjectState.error);
    }
  }

  Future<bool> addProject(String namaProyek, String lokasi, String status) async {
    _setState(ProjectState.loading);
    try {
      final companion = ProjectsCompanion(
        namaProyek: drift.Value(namaProyek),
        lokasi: drift.Value(lokasi),
        status: drift.Value(status),
      );
      
      await _repository.add(companion);
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
