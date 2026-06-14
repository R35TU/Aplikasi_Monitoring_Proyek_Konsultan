import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../backend/repositories/report_repository.dart';

import '../../../backend/models/project_model.dart';

class DataReportDetailPage extends StatefulWidget {
  final ProjectModel project;
  const DataReportDetailPage({super.key, required this.project});

  @override
  State<DataReportDetailPage> createState() => _DataReportDetailPageState();
}

class _DataReportDetailPageState extends State<DataReportDetailPage> {
  late ReportRepository _reportRepository;
  late Future<List<Map<String, dynamic>>> _reportsFuture;
  
  List<Map<String, dynamic>> _allReports = [];
  Map<String, List<Map<String, dynamic>>> _reportsByDate = {};
  List<String> _availableDates = [];
  int _selectedDateIndex = 0;

  @override
  void initState() {
    super.initState();
    _reportRepository = ReportRepository(Supabase.instance.client);
    _loadReports();
  }

  void _loadReports() {
    setState(() {
      _reportsFuture = _reportRepository.ambilLaporanBerdasarkanProyek(widget.project.id).then((reports) {
        _allReports = reports;
        _reportsByDate.clear();
        for (var r in reports) {
          final dateStrRaw = r['tanggal'] as String;
          // Ambil hanya bagian YYYY-MM-DD (10 karakter pertama) agar laporan di hari yang sama jadi 1 grup
          final dateStr = dateStrRaw.length >= 10 ? dateStrRaw.substring(0, 10) : dateStrRaw;

          if (!_reportsByDate.containsKey(dateStr)) {
            _reportsByDate[dateStr] = [];
          }
          _reportsByDate[dateStr]!.add(r);
        }
        _availableDates = _reportsByDate.keys.toList();
        _availableDates.sort((a, b) => b.compareTo(a)); // Descending order
        return reports;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Data Laporan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _reportsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          }

          if (_availableDates.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada laporan untuk proyek ini.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          final selectedDateStr = _availableDates[_selectedDateIndex];
          final reportsForSelectedDate = _reportsByDate[selectedDateStr] ?? [];

          return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    project.imagePath,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        project.location,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: project.status == 'Selesai'
                                  ? const Color(0xFFDDE8FF)
                                  : const Color(0xFFE6F4EA),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: project.status == 'Selesai'
                                        ? const Color(0xFF2563EB)
                                        : const Color(0xFF16A34A),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  project.status,
                                  style: TextStyle(
                                    color: project.status == 'Selesai'
                                        ? const Color(0xFF2563EB)
                                        : const Color(0xFF16A34A),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Month header and day selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left, color: Colors.black54),
                ),
                Text(
                  selectedDateStr,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 84,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _availableDates.length,
                      itemBuilder: (context, index) {
                        final dateStr = _availableDates[index];
                        final selected = index == _selectedDateIndex;
                        final dt = DateTime.tryParse(dateStr);
                        final dayName = dt != null ? _getHari(dt.weekday) : '';
                        final dayDate = dt != null ? dt.day.toString().padLeft(2, '0') : '';

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedDateIndex = index),
                            child: Container(
                              width: 56,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selected ? const Color(0xFF2563EB) : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: selected ? const Color(0xFF2563EB) : Colors.grey.shade300,
                                ),
                                boxShadow: selected
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.04),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dayName,
                                    style: TextStyle(
                                      color: selected ? Colors.white : Colors.grey.shade700,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    dayDate,
                                    style: TextStyle(
                                      color: selected ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF16A34A),
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Text(
              'Laporan pada: $selectedDateStr',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 12),

            // Report items
            if (reportsForSelectedDate.isEmpty)
              const Text('Tidak ada laporan di tanggal ini.', style: TextStyle(color: Colors.grey))
            else
              ...reportsForSelectedDate.map((r) {
                final aktivitas = r['deskripsi'] ?? r['aktivitas'] ?? 'Laporan Pengawasan';
                final created = r['created_at'] ?? '';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildReportItem(
                    aktivitas,
                    'Dibuat : $created',
                    const Color(0xFFE6F4EA),
                    const Color(0xFF16A34A),
                  ),
                );
              }),
          ],
        ),
      );
        }
      ),
    );
  }

  String _getHari(int weekday) {
    switch (weekday) {
      case 1: return 'Sen';
      case 2: return 'Sel';
      case 3: return 'Rab';
      case 4: return 'Kam';
      case 5: return 'Jum';
      case 6: return 'Sab';
      case 7: return 'Min';
      default: return '';
    }
  }

  Widget _buildReportItem(
    String title,
    String subtitle,
    Color bg,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.insert_drive_file, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
