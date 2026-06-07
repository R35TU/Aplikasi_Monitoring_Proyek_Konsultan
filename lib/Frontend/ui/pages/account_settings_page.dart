import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'project_list_page.dart';
import 'report_page.dart';
import 'history_page.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  int _selectedIndex = 4;
  bool _pushNotification = true;
  bool _emailNotification = true;
  bool _projectNotification = true;
  bool _reportNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preferensi Aplikasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildOptionCard(
              icon: Icons.wb_sunny_outlined,
              title: 'Tema Aplikasi',
              subtitle: 'Pilih tema aplikasi',
              trailing: 'Terang',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildOptionCard(
              icon: Icons.language_outlined,
              title: 'Bahasa',
              subtitle: 'Bahasa aplikasi',
              trailing: 'Indonesia',
              onTap: () {},
            ),
            const SizedBox(height: 24),
            const Text('Notifikasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildNotificationTile(
              icon: Icons.notifications_outlined,
              title: 'Notifikasi Push',
              subtitle: 'Terima notifikasi di perangkat',
              value: _pushNotification,
              onChanged: (value) => setState(() => _pushNotification = value),
            ),
            _buildNotificationTile(
              icon: Icons.email_outlined,
              title: 'Email Notifikasi',
              subtitle: 'Terima notifikasi melalui email',
              value: _emailNotification,
              onChanged: (value) => setState(() => _emailNotification = value),
            ),
            _buildNotificationTile(
              icon: Icons.folder_open_outlined,
              title: 'Notifikasi Proyek',
              subtitle: 'Update terkait proyek terkait',
              value: _projectNotification,
              onChanged: (value) => setState(() => _projectNotification = value),
            ),
            _buildNotificationTile(
              icon: Icons.insert_drive_file_outlined,
              title: 'Notifikasi Laporan',
              subtitle: 'Pengingat dan status laporan',
              value: _reportNotification,
              onChanged: (value) => setState(() => _reportNotification = value),
            ),
            const SizedBox(height: 24),
            const Text('Lainnya', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildOptionCard(
              icon: Icons.notifications_active_outlined,
              title: 'Notifikasi Push',
              subtitle: 'Terima notifikasi di perangkat',
              trailing: '',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildOptionCard(
              icon: Icons.email_outlined,
              title: 'Email Notifikasi',
              subtitle: 'Terima notifikasi melalui email',
              trailing: '',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildOptionCard(
              icon: Icons.folder_open_outlined,
              title: 'Notifikasi Proyek',
              subtitle: 'Update terkait proyek terkait',
              trailing: '',
              onTap: () {},
            ),
          ],
        ),
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
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
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

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: const Color(0xFF2563EB)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            if (trailing.isNotEmpty)
              Text(trailing, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF334155)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged, activeColor: const Color(0xFF2563EB)),
        ],
      ),
    );
  }
}
