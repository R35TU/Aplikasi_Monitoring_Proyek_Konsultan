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
  final TextEditingController _workersController = TextEditingController(text: '13');
  String _selectedWeather = 'Cerah';
  
  // Dummy data for materials to match the design. In a real scenario, this would be empty initially.
  final List<Map<String, dynamic>> _materials = [
    {'nama': 'Betton K-300', 'satuan': 'm^3', 'volume': '12'}
  ];

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
      final reportId = await _reportRepo.tambahLaporan({
        'proyek_id': _selectedProject!.id,
        'tanggal': _selectedDate.toIso8601String(),
        'deskripsi': _activityController.text,
        'jumlah_pekerja': int.tryParse(_workersController.text) ?? 0,
        'cuaca': _selectedWeather,
        'pembuat_id': _supabase.auth.currentUser?.id ?? '00000000-0000-0000-0000-000000000000',
        'jenis_laporan': 'Pengawasan',
      });

      if (_materials.isNotEmpty) {
        final materialsToInsert = _materials.map((m) => {
          'report_id': reportId,
          'nama_material': m['nama'],
          'satuan': m['satuan'],
          'volume': double.tryParse(m['volume'].toString()) ?? 0.0,
        }).toList();
        await _reportRepo.tambahMaterialLaporan(materialsToInsert);
      }

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

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  void _tambahMaterialDialog() {
    String nama = '';
    String satuan = '';
    String volume = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Material'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nama Material (cth: Semen)'),
                onChanged: (v) => nama = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Satuan (cth: Sak)'),
                onChanged: (v) => satuan = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Volume (cth: 10)'),
                keyboardType: TextInputType.number,
                onChanged: (v) => volume = v,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nama.isNotEmpty && satuan.isNotEmpty && volume.isNotEmpty) {
                  setState(() {
                    _materials.add({'nama': nama, 'satuan': satuan, 'volume': volume});
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Buat Laporan Pengawasan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: _activeProjects.isEmpty
          ? const Center(
              child: Text("Proyek kosong, tambah proyek dulu di Dashboard"),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Proyek', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<ProjectModel>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    value: _selectedProject,
                    items: _activeProjects
                        .map(
                          (p) => DropdownMenuItem(
                            value: p,
                            child: Text(p.namaProyek, style: const TextStyle(fontWeight: FontWeight.w600)),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _selectedProject = v),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                  
                  const SizedBox(height: 20),
                  const Text('Tanggal Laporan', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _pickDate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[500]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDate(_selectedDate),
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const Icon(Icons.calendar_today, color: Colors.black),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text('Aktivitas Pekerjaan', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _activityController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Pekerja', style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _workersController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text('orang', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Cuaca', style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedWeather,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: ['Cerah', 'Berawan', 'Hujan Sedang', 'Hujan Lebat']
                                  .map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(fontWeight: FontWeight.w600))))
                                  .toList(),
                              onChanged: (v) {
                                if (v != null) setState(() => _selectedWeather = v);
                              },
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text('Material', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Expanded(flex: 2, child: Text('Material', style: TextStyle(fontWeight: FontWeight.bold))),
                              Expanded(flex: 1, child: Text('Satuan', style: TextStyle(fontWeight: FontWeight.bold))),
                              Expanded(flex: 1, child: Text('Volume', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        const Divider(height: 1, thickness: 1, color: Colors.black87),
                        ..._materials.map((m) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text(m['nama'], style: const TextStyle(fontWeight: FontWeight.w600))),
                              Expanded(flex: 1, child: Text(m['satuan'], style: const TextStyle(fontWeight: FontWeight.w600))),
                              Expanded(flex: 1, child: Text(m['volume'].toString(), textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600))),
                            ],
                          ),
                        )).toList(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: _tambahMaterialDialog,
                      icon: const Icon(Icons.add, color: Colors.blue),
                      label: const Text('+ Tambah Material', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text('Foto Dokumentasi', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPhotoPlaceholder(),
                        const SizedBox(width: 8),
                        _buildPhotoPlaceholder(),
                        const SizedBox(width: 8),
                        _buildPhotoPlaceholder(),
                        const SizedBox(width: 8),
                        _buildPhotoPlaceholder(),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(Icons.add, color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _submitLaporan,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Simpan Laporan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildPhotoPlaceholder() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.image, color: Colors.white54),
      ),
    );
  }
}
