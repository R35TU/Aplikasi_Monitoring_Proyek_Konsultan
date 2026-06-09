import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/project_provider.dart';
import '../../providers/report_provider.dart';

class CreateSupervisionReportPage extends StatefulWidget {
  const CreateSupervisionReportPage({super.key});

  @override
  State<CreateSupervisionReportPage> createState() => _CreateSupervisionReportPageState();
}

class _CreateSupervisionReportPageState extends State<CreateSupervisionReportPage> {
  int? _selectedProjectId;
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _progressController = TextEditingController(text: '0');
  String _selectedWeather = 'Cerah';

  final List<Map<String, String>> _materials = [
    {'material': 'Betton K-300', 'satuan': 'm^3', 'volume': '12'},
  ];

  final List<String> _photos = [];

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) setState(() => _selectedDate = d);
  }

  @override
  void dispose() {
    _activityController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProjectProvider>().loadProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Buat Laporan Pengawasan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Proyek', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Consumer<ProjectProvider>(
              builder: (context, projectProvider, _) {
                final projects = projectProvider.projects;
                return DropdownButtonFormField<int>(
                  value: _selectedProjectId,
                  hint: const Text('Pilih Proyek'),
                  items: projects.map((project) {
                    return DropdownMenuItem<int>(
                      value: project.id,
                      child: Text(project.title),
                    );
                  }).toList(),
                  onChanged: (v) => setState(() => _selectedProjectId = v),
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                );
              }
            ),

            const SizedBox(height: 16),
            const Text('Tanggal Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${_selectedDate.day} ${_monthName(_selectedDate.month)} ${_selectedDate.year}'),
                    const Icon(Icons.calendar_today, color: Colors.black54),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text('Aktivitas Pekerjaan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _activityController,
              maxLines: 5,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Progress Laporan (%)', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _progressController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cuaca', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedWeather,
                        items: const [
                          DropdownMenuItem(value: 'Cerah', child: Text('Cerah')),
                          DropdownMenuItem(value: 'Mendung', child: Text('Mendung')),
                          DropdownMenuItem(value: 'Hujan', child: Text('Hujan')),
                        ],
                        onChanged: (v) => setState(() => _selectedWeather = v ?? _selectedWeather),
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text('Material', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    color: Colors.grey.shade100,
                    child: Row(
                      children: const [
                        Expanded(child: Text('Material', style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 120, child: Text('Satuan', style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 80, child: Text('Volume', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  ..._materials.map((m) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(child: Text(m['material']!)),
                          SizedBox(width: 120, child: Text(m['satuan']!)),
                          SizedBox(width: 80, child: Text(m['volume']!)),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _materials.add({'material': 'Material Baru', 'satuan': '-', 'volume': '0'});
                  });
                },
                icon: const Icon(Icons.add, color: Colors.blue),
                label: const Text(' Tambah Material', style: TextStyle(color: Colors.blue)),
              ),
            ),

            const SizedBox(height: 8),
            const Text('Foto Dokumentasi', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 76,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _photos.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  if (index == _photos.length) {
                    return GestureDetector(
                      onTap: () {
                        // placeholder for image picker
                        setState(() => _photos.add('img_${_photos.length}'));
                      },
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                        child: const Center(child: Icon(Icons.add, color: Colors.grey)),
                      ),
                    );
                  }
                  return Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                    child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Consumer<ReportProvider>(
                builder: (context, reportProvider, child) {
                  return ElevatedButton(
                    onPressed: reportProvider.state == ReportFetchState.loading ? null : () async {
                      if (_selectedProjectId == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pilih proyek terlebih dahulu')));
                        return;
                      }
                      
                      final progress = int.tryParse(_progressController.text) ?? 0;
                      final tgl = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
                      
                      final success = await reportProvider.submitReport(
                        _selectedProjectId!,
                        _activityController.text,
                        progress,
                        tgl,
                      );
                      
                      if (success && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Laporan berhasil disimpan')));
                        Navigator.pop(context);
                      } else if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal: ${reportProvider.errorMessage}')));
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    child: reportProvider.state == ReportFetchState.loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Simpan Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int m) {
    const names = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
    return names[m - 1];
  }
}
