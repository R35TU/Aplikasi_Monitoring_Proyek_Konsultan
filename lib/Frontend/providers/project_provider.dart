import 'package:flutter/material.dart';
import '../../backend/repositories/project_repository.dart';
import '../../backend/models/project_model.dart';

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
      _projects = await _repository.ambilSemuaProyek();
      _setState(ProjectState.loaded);
    } catch (e) {
      _errorMessage = e.toString();
      _setState(ProjectState.error);
    }
  }

  Future<bool> addProject(String namaProyek, String lokasi, String status) async {
    _setState(ProjectState.loading);
    try {
      final projectData = {
        'nama_proyek': namaProyek,
        'lokasi': lokasi,
        'status': status,
        'progress_rencana': 0,
        'progress_aktual': 0,
        'nama_perusahaan': 'Tidak Diketahui',
      };
      
      await _repository.tambahProyek(projectData);
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
      // await _repository.hapusProyek(id); // Implement hapusProyek di repo jika dibutuhkan
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
