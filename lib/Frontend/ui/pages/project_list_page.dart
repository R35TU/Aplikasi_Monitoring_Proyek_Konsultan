import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/project_provider.dart';

import '../../../backend/models/project_model.dart';
import 'dashboard_page.dart';
import 'project_detail_page.dart';
import 'report_page.dart';
import 'history_page.dart';
import 'account_page.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  int _selectedIndex = 1; 
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProjectProvider>(context, listen: false).loadProjects();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddProjectDialog(BuildContext context) {
    final titleController = TextEditingController();
    final locationController = TextEditingController();
    String kategori = 'Infrastruktur';
    final nilaiKontrakController = TextEditingController();
    String status = 'Perencanaan';
    final tanggalMulaiController = TextEditingController();
    final tanggalSelesaiController = TextEditingController();
    final pemilikController = TextEditingController();
    final sumberDanaController = TextEditingController();
    final kontraktorController = TextEditingController();
    final deskripsiController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Tambah Proyek Baru', style: TextStyle(fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Nama Proyek'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(labelText: 'Lokasi'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: kategori,
                      decoration: const InputDecoration(labelText: 'Kategori'),
                      items: const [
                        DropdownMenuItem(value: 'Infrastruktur', child: Text('Infrastruktur')),
                        DropdownMenuItem(value: 'Gedung', child: Text('Gedung')),
                        DropdownMenuItem(value: 'SDA', child: Text('SDA')),
                      ],
                      onChanged: (val) {
                        if (val != null) setState(() => kategori = val);
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nilaiKontrakController,
                      decoration: const InputDecoration(labelText: 'Nilai Kontrak (Rp)'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: status,
                      decoration: const InputDecoration(labelText: 'Status'),
                      items: const [
                        DropdownMenuItem(value: 'Perencanaan', child: Text('Perencanaan')),
                        DropdownMenuItem(value: 'Progres', child: Text('Progres')),
                        DropdownMenuItem(value: 'Selesai', child: Text('Selesai')),
                        DropdownMenuItem(value: 'Dibatalkan', child: Text('Dibatalkan')),
                      ],
                      onChanged: (val) {
                        if (val != null) setState(() => status = val);
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: tanggalMulaiController,
                      decoration: const InputDecoration(labelText: 'Tanggal Mulai (e.g. 1 Januari 2026)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: tanggalSelesaiController,
                      decoration: const InputDecoration(labelText: 'Tanggal Selesai (e.g. 30 Februari 2026)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: pemilikController,
                      decoration: const InputDecoration(labelText: 'Pemilik Proyek / Instansi'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: sumberDanaController,
                      decoration: const InputDecoration(labelText: 'Sumber Dana'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: kontraktorController,
                      decoration: const InputDecoration(labelText: 'Kontraktor Pelaksana'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: deskripsiController,
                      decoration: const InputDecoration(labelText: 'Deskripsi Proyek'),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final title = titleController.text.trim();
                    final location = locationController.text.trim();
                    final nilaiKontrak = double.tryParse(nilaiKontrakController.text.trim()) ?? 0.0;

                    if (title.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Nama proyek tidak boleh kosong')),
                      );
                      return;
                    }

                    final newProject = ProjectModel(
                      title: title,
                      location: location,
                      kategori: kategori,
                      status: status,
                      targetProgress: 0.0,
                      actualProgress: 0.0,
                      imagePath: 'assets/images/bottom_bg.png',
                      nilaiKontrak: nilaiKontrak,
                      tanggalMulai: tanggalMulaiController.text.trim(),
                      tanggalSelesai: tanggalSelesaiController.text.trim(),
                      namaPemilik: pemilikController.text.trim(),
                      sumberDana: sumberDanaController.text.trim(),
                      kontraktorId: kontraktorController.text.trim(),
                      deskripsi: deskripsiController.text.trim(),
                    );

                    await Provider.of<ProjectProvider>(context, listen: false).createProject(newProject);
                    Navigator.pop(context);
                  },
                  child: const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    final projects = projectProvider.projects.where((p) {
      if (_searchQuery.isEmpty) return true;
      return p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.location.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // 3. Use DefaultTabController for the 4 tabs
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA), // Light gray background
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          title: const Text(
            'Daftar Proyek',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  // 4. Search Bar and Filter Icon
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (val) {
                            setState(() {
                              _searchQuery = val.trim();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari Proyek..',
                            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.filter_alt_outlined, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // 5. Add Project Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showAddProjectDialog(context),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Tambah Proyek',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0055FF), // Main blue color
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // 6. TabBar Menu
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Color(0xFF0055FF),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF0055FF),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                tabs: [
                  Tab(text: 'Semua'),
                  Tab(text: 'Progres'),
                  Tab(text: 'Selesai'),
                  Tab(text: 'Dibatalkan'),
                ],
              ),
            ),
            
            // 7. TabBar Views (The Lists)
            Expanded(
              child: TabBarView(
                children: [
                  _buildProjectList(projects), // Tab Semua
                  _buildProjectList(projects.where((p) => p.status == 'Progres').toList()), // Tab Progres
                  _buildProjectList(projects.where((p) => p.status == 'Selesai').toList()), // Tab Selesai
                  _buildProjectList(projects.where((p) => p.status == 'Dibatalkan').toList()), // Tab Dibatalkan
                ],
              ),
            ),
          ],
        ),

        // 8. Bottom Navigation Bar
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
            selectedItemColor: const Color(0xFF0055FF),
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
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dashboard'),
              BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Proyek'),
              BottomNavigationBarItem(icon: Icon(Icons.insert_drive_file_outlined), label: 'Laporan'),
              BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Akun'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the ListView
  Widget _buildProjectList(List<ProjectModel> projects) {
    if (projects.isEmpty) {
      return const Center(
        child: Text('Tidak ada proyek.', style: TextStyle(color: Colors.grey)),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(projects[index]);
      },
    );
  }

  // Helper widget to build individual Project Card
  Widget _buildProjectCard(ProjectModel project) {
    // Determine colors based on status
    Color statusColor = project.status == 'Selesai' ? const Color(0xFF0055FF) : Colors.green;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProjectDetailPage(project: project),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                project.imagePath,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            
            // Project Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Title, Location, Status
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          project.location,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(radius: 4, backgroundColor: statusColor),
                              const SizedBox(width: 4),
                              Text(
                                project.status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Right side: Progress Bars
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _buildProgressBar('${(project.targetProgress * 100).toInt()}%', project.targetProgress, Colors.green),
                        const SizedBox(height: 8),
                        _buildProgressBar('${(project.actualProgress * 100).toInt()}%', project.actualProgress, const Color(0xFF0055FF)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the Progress Bar and Percentage text
  Widget _buildProgressBar(String percentage, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          percentage,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}