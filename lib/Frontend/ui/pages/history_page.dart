import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'project_list_page.dart';
import 'report_page.dart';
import 'account_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedIndex = 3;

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
        title: const Text('Kronologi Proyek', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 148,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: const Center(
                    child: Icon(Icons.timeline, size: 56, color: Color(0xFF3730A3)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Pembangunan Jembatan Alam', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 6),
                      Text('Purwokerto', style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ..._timelineItems.map((item) => _HistoryTimelineItem(item: item)).toList(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF3B82F6),
          unselectedItemColor: Colors.grey.shade400,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
              return;
            }
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProjectListPage()),
              );
              return;
            }
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportPage()),
              );
              return;
            }
            if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
              return;
            }
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.folder_outlined), label: 'Proyek'),
            BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file_outlined), label: 'Laporan'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
          ],
        ),
      ),
    );
  }
}

final List<_TimelineItemData> _timelineItems = [
  _TimelineItemData(date: '1 Januari 2025', time: '14:30', title: 'Proyek Dibuat', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '2 Januari 2025', time: '11:30', title: 'Menambahkan Folder Administrasi "Pra Kontrak"', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '3 Januari 2025', time: '12:35', title: 'Menambahkan File dalam folder "Pra Kontrak"', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '4 Januari 2025', time: '11:30', title: 'Menambahkan Folder Administrasi "Dokumen Kontrak"', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '4 Januari 2025', time: '11:35', title: 'Menambahkan File dalam folder "Dokumen Kontrak"', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '5 Januari 2025', time: '11:35', title: 'Menambahkan File dalam folder "PCM"', subtitle: 'Aradea (Konsultan)', color: Color(0xFF2563EB)),
  _TimelineItemData(date: '5 Januari 2025', time: '11:40', title: 'Laporan Harian Progress Fisik', subtitle: 'Bambang (Kontraktor)', color: Color(0xFF16A34A)),
  _TimelineItemData(date: '6 Januari 2025', time: '15:30', title: 'Laporan Harian Disetujui', subtitle: 'Herlambang (Konsultan)', color: Color(0xFF16A34A)),
  _TimelineItemData(date: '6 Januari 2025', time: '11:35', title: 'Laporan Harian Progress Pengawasan', subtitle: 'Bagus (Konsultan)', color: Color(0xFF16A34A)),
];

class _TimelineItemData {
  final String date;
  final String time;
  final String title;
  final String subtitle;
  final Color color;

  const _TimelineItemData({required this.date, required this.time, required this.title, required this.subtitle, required this.color});
}

class _HistoryTimelineItem extends StatelessWidget {
  final _TimelineItemData item;
  const _HistoryTimelineItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
            ),
            Container(
              width: 2,
              height: 100,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(item.time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 6),
                Text(item.subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
