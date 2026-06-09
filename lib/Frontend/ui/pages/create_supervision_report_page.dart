import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../backend/repositories/project_repository.dart';
import '../../../backend/repositories/report_repository.dart';
import '../../../backend/models/project_model.dart';

class CreateSupervisionReportPage extends StatefulWidget {
  const CreateSupervisionReportPage({super.key});

  @override
  State<CreateSupervisionReportPage> createState() =>
      _CreateSupervisionReportPageState();
}

class _CreateSupervisionReportPageState
    extends State<CreateSupervisionReportPage> {
  late SupabaseClient _supabase;
  late ProjectRepository _projectRepo;
  late ReportRepository _reportRepo;

  List<ProjectModel> _activeProjects = [];
  ProjectModel? _selectedProject;
  bool _isLoading = false;

  DateTime _selectedDate = DateTime.now();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _workersController = TextEditingController(
    text: '0',
  );
  String _selectedWeather = 'Cerah';

  @override
  void initState() {
    super.initState();
    _supabase = Supabase.instance.client;
    _projectRepo = ProjectRepository(_supabase);
    _reportRepo = ReportRepository(_supabase);
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    var projects = await _projectRepo.ambilSemuaProyek();
    setState(() {
      _activeProjects = projects;
      if (_activeProjects.isNotEmpty) {
        _selectedProject = _activeProjects.first;
      }
    });
  }

  Future<void> _submitLaporan() async {
    if (_selectedProject == null) return;

    setState(() => _isLoading = true);

    try {
      await _reportRepo.tambahLaporan({
        'proyek_id': _selectedProject!.id,
        'tanggal': _selectedDate.toIso8601String(),
        'deskripsi': _activityController.text,
        'jumlah_pekerja': int.tryParse(_workersController.text) ?? 0,
        'cuaca': _selectedWeather,
        'pembuat_id': '1', // FIX: String
        'jenis_laporan': 'Pengawasan',
      });

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Laporan Pengawasan')),
      body: _activeProjects.isEmpty
          ? const Center(
              child: Text("Proyek kosong, tambah proyek dulu di Dashboard"),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DropdownButtonFormField<ProjectModel>(
                    value: _selectedProject,
                    items: _activeProjects
                        .map(
                          (p) =>
                              DropdownMenuItem(value: p, child: Text(p.title)),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _selectedProject = v),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _activityController,
                    decoration: const InputDecoration(labelText: 'Aktivitas'),
                  ),
                  TextFormField(
                    controller: _workersController,
                    decoration: const InputDecoration(labelText: 'Pekerja'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _submitLaporan,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Simpan Laporan'),
                  ),
                ],
              ),
            ),
    );
  }
}
