import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'data_report_page.dart';
import 'project_list_page.dart';
import 'create_supervision_report_page.dart';
import 'confirmation_request_page.dart';
import 'report_summary_page.dart';
import 'history_page.dart';
import 'account_page.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Laporan Proyek',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildReportCard(
              title: 'Data Laporan',
              subtitle:
                  'Lihat daftar proyek dan semua data laporan yang tersedia',
              icon: Icons.folder_outlined,
              iconBackground: const Color(0xFFE0F2FE),
              iconColor: const Color(0xFF3B82F6),
              onTap: _navigateToDataReportPage,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              title: 'Buat Laporan Pengawasan',
              subtitle: 'Buat Laporan Pengawasan Harian Proyek',
              icon: Icons.edit_document,
              iconBackground: const Color(0xFFE6F4EA),
              iconColor: const Color(0xFF16A34A),
              onTap: _navigateToCreateReportPage,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              title: 'Permintaan Konfirmasi Laporan',
              subtitle: 'Laporan Kontraktor untuk dikonfirmasi',
              icon: Icons.request_page,
              iconBackground: const Color(0xFFFEF3C7),
              iconColor: const Color(0xFFF59E0B),
              onTap: _navigateToConfirmationPage,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              title: 'Rekap Laporan',
              subtitle: 'Generate Rekap Laporan Mingguan / Bulanan',
              icon: Icons.analytics_outlined,
              iconBackground: const Color(0xFFF3E8FF),
              iconColor: const Color(0xFF8B5CF6),
              onTap: _navigateToReportSummaryPage,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
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
                MaterialPageRoute(
                  builder: (context) => const ProjectListPage(),
                ),
              );
              return;
            }
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              label: 'Proyek',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_drive_file_outlined),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDataReportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataReportPage()),
    );
  }

  void _navigateToCreateReportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateSupervisionReportPage(),
      ),
    );
  }

  void _navigateToConfirmationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmationRequestPage()),
    );
  }

  void _navigateToReportSummaryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReportSummaryPage()),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBackground,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
