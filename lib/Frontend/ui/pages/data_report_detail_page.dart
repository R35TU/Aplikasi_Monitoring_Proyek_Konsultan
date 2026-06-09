import 'package:flutter/material.dart';

import '../../../backend/models/project_model.dart';
import 'package:provider/provider.dart';
import '../../providers/report_provider.dart';

class DataReportDetailPage extends StatefulWidget {
  final ProjectModel project;
  const DataReportDetailPage({super.key, required this.project});

  @override
  State<DataReportDetailPage> createState() => _DataReportDetailPageState();
}

class _DataReportDetailPageState extends State<DataReportDetailPage> {
  int _selectedDayIndex = 3; // example selected day (4th day)
  int _startDayIndex = 0; // starting position for date display (shows 7 days at a time)

  // days 1..30 for the horizontal selector (repeating weekday names)
  final List<Map<String, dynamic>> _days = List.generate(30, (i) {
    final names = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return {
      'name': names[i % names.length],
      'date': (i + 1).toString().padLeft(2, '0'),
      'hasPengawasan': (i % 2) == 0,
      'hasFisik': (i % 3) == 0,
    };
  });

  void _previousWeek() {
    setState(() {
      if (_startDayIndex > 0) {
        _startDayIndex--;
      }
    });
  }

  void _nextWeek() {
    setState(() {
      if (_startDayIndex < _days.length - 7) {
        _startDayIndex++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.project.id != null) {
        context.read<ReportProvider>().loadReportsByProject(widget.project.id!);
      }
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
        title: const Text('Data Laporan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    project.imagePath ?? 'assets/images/placeholder.png',
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
                      Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(project.location, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: project.status == 'Selesai' ? const Color(0xFFDDE8FF) : const Color(0xFFE6F4EA),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(width: 8, height: 8, decoration: BoxDecoration(color: project.status == 'Selesai' ? const Color(0xFF2563EB) : const Color(0xFF16A34A), shape: BoxShape.circle)),
                                const SizedBox(width: 6),
                                Text(project.status, style: TextStyle(color: project.status == 'Selesai' ? const Color(0xFF2563EB) : const Color(0xFF16A34A), fontWeight: FontWeight.bold, fontSize: 12)),
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left, color: Colors.black54)),
                Text('Januari 2025', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 48,
                  child: IconButton(onPressed: _previousWeek, icon: const Icon(Icons.chevron_left, color: Colors.black54)),
                ),
                Expanded(
                  child: SizedBox(
                    height: 84,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        7,
                        (viewIndex) {
                          final index = _startDayIndex + viewIndex;
                          if (index >= _days.length) {
                            return const SizedBox.shrink();
                          }
                          final d = _days[index];
                          final selected = index == _selectedDayIndex;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedDayIndex = index),
                              child: Container(
                                width: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: selected ? const Color(0xFF2563EB) : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: selected ? const Color(0xFF2563EB) : Colors.grey.shade300),
                                  boxShadow: selected
                                      ? [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]
                                      : null,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(d['name'], style: TextStyle(color: selected ? Colors.white : Colors.grey.shade700, fontSize: 11)),
                                    const SizedBox(height: 4),
                                    Text(d['date'], style: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Pengawasan dot with thin white outline
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: d['hasPengawasan'] ? const Color(0xFF16A34A) : Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 1),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        // Fisik dot with thin white outline
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: d['hasFisik'] ? const Color(0xFF2563EB) : Colors.transparent,
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
                ),
                SizedBox(
                  width: 48,
                  child: IconButton(onPressed: _nextWeek, icon: const Icon(Icons.chevron_right, color: Colors.black54)),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Text('Kamis, 04 Januari 2025', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
            const SizedBox(height: 12),

            // Report items
            Consumer<ReportProvider>(
              builder: (context, reportProvider, _) {
                if (reportProvider.state == ReportFetchState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                final reports = reportProvider.reports;
                if (reports.isEmpty) {
                  return const Center(child: Text('Belum ada laporan untuk proyek ini.', style: TextStyle(color: Colors.grey)));
                }

                return Column(
                  children: reports.map((r) {
                    final isSubmitted = r.statusPersetujuan == 'submitted';
                    final colorBg = isSubmitted ? const Color(0xFFDDE8FF) : const Color(0xFFE6F4EA);
                    final colorIcon = isSubmitted ? const Color(0xFF2563EB) : const Color(0xFF16A34A);
                    final deskripsi = r.deskripsi ?? 'Tanpa deskripsi';
                    final formatTanggal = '${r.createdAt.day.toString().padLeft(2, '0')}/${r.createdAt.month.toString().padLeft(2, '0')}/${r.createdAt.year}';
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildReportItem(deskripsi, 'Tanggal : $formatTanggal', colorBg, colorIcon),
                    );
                  }).toList(),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String title, String subtitle, Color bg, Color iconColor) {
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
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.insert_drive_file, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
