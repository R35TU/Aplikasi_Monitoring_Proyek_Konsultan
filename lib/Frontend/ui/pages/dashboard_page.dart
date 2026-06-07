import 'package:flutter/material.dart';
import 'project_list_page.dart';
import 'report_page.dart';
import 'history_page.dart';
import 'account_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Very light gray background
     appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 1,
  shadowColor: Colors.black12,
  leading: IconButton(
    icon: const Icon(
      Icons.menu,
      color: Colors.black,
    ),
    onPressed: () {},
  ),
  centerTitle: true,
  title: const Text(
    "Dashboard",
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
          onPressed: () {
            // Handle notification tap
          },
          icon: const Icon(
            Icons.notifications_rounded,
            color: Colors.black,
            size: 28,
          ),
        ),
        // Notification badge
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
    const SizedBox(width: 8),
  ],
),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Section
            const Text(
              'Selamat Datang,',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            const Text(
              'Aradea Kingdom',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Text(
              'Konsultan',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // 2. Summary Cards Section
            Row(
              children: [
                _buildSummaryCard(
              'Total Proyek',
              '5',
              Icons.folder,
              Colors.blue,
              onTap: _navigateToProjectListPage,
            ),
                const SizedBox(width: 16),
                _buildSummaryCard('Progres', '3', Icons.bar_chart, Colors.green),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildSummaryCard('Laporan Hari Ini', '4', Icons.insert_drive_file, Colors.orange),
                const SizedBox(width: 16),
                _buildSummaryCard('Proyek Selesai', '2', Icons.check_box, Colors.blue),
              ],
            ),
            const SizedBox(height: 32),

            // 3. On Progress Projects Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Proyek On Progress',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildProgressItem('Fly Over Jl. Jendral Sudirman', 0.8, Colors.green),
            _buildProgressItem('Pembangunan Jembatan Sirothol Mustakim', 0.4, Colors.orange),
            _buildProgressItem('Pengecoran Jalan Desa Hebat Sekali', 0.15, Colors.deepOrange),
            const SizedBox(height: 32),

            // 4. Project Progress Section (Donut Chart)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Progres Proyek',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      // Circular Progress (Donut Chart)
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                value: 1.0,
                                strokeWidth: 20,
                                color: Colors.blue.shade100, // Background progress color
                              ),
                            ),
                            Transform.rotate(
                              angle: -1.5708, // Rotate indicator to start from the top (12 o'clock)
                              child: const SizedBox(
                                width: 120,
                                height: 120,
                                child: CircularProgressIndicator(
                                  value: 0.67, // 67% progress value
                                  strokeWidth: 20,
                                  color: Color(0xFF3B82F6), // Main blue color
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '67%',
                                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rata-rata Progres',
                                  style: TextStyle(fontSize: 8, color: Colors.black87),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      
                      // Legend Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLegendItem(const Color(0xFF3B82F6), 'Selesai', '(37,5%)'),
                            const SizedBox(height: 12),
                            _buildLegendItem(Colors.blue.shade100, 'Proses', '(25.0%)'),
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
      ),
      
      // 5. Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -5)),
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
            if (index == 1) {
              _navigateToProjectListPage();
              return;
            }
            if (index == 2) {
              _navigateToReportPage();
              return;
            }
            if (index == 3) {
              _navigateToHistoryPage();
              return;
            }
            if (index == 4) {
              _navigateToAccountPage();
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

  // Custom widget for Summary Cards
  Widget _buildSummaryCard(String title, String count, IconData icon, Color iconColor, {VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  // Icon with 15% opacity background
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: iconColor, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                count,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProjectListPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProjectListPage()),
    );
  }

  void _navigateToReportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReportPage()),
    );
  }

  void _navigateToHistoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoryPage()),
    );
  }

  void _navigateToAccountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AccountPage()),
    );
  }

  // Custom widget for Progress Bar list
  Widget _buildProgressItem(String title, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom widget for Donut Chart Legend
  Widget _buildLegendItem(Color color, String title, String percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 5, backgroundColor: color),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),
        Text(percentage, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}