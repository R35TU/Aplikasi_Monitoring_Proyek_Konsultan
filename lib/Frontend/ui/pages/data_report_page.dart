import 'package:flutter/material.dart';

// Import jalur relatif (naik 3 folder)
import '../../../backend/models/project_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../backend/repositories/project_repository.dart';
import 'data_report_detail_page.dart';

class DataReportPage extends StatefulWidget {
  const DataReportPage({super.key});

  @override
  State<DataReportPage> createState() => _DataReportPageState();
}

class _DataReportPageState extends State<DataReportPage> {
  late ProjectRepository _projectRepository;
  late Future<List<ProjectModel>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    final supabase = Supabase.instance.client;
    _projectRepository = ProjectRepository(supabase);
    _projectsFuture = _projectRepository.ambilSemuaProyek();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<ProjectModel>>(
          future: _projectsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Terjadi kesalahan: ${snapshot.error}'),
              );
            }

            // Tampilkan semua proyek agar laporan yang baru dibuat pada proyek baru tetap muncul
            final projects = (snapshot.data ?? []).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Proyek..',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        color: const Color(0xFFD8E7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: const Color(0xFF0055FF),
                      unselectedLabelColor: const Color(0xFF6B7280),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      tabs: const [
                        Tab(text: 'Semua'),
                        Tab(text: 'On Progress'),
                        Tab(text: 'Selesai'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildProjectList(projects),
                      _buildProjectList(
                        projects.where((p) => p.status == 'Progres').toList(),
                      ),
                      _buildProjectList(
                        projects.where((p) => p.status == 'Selesai').toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        // Tombol FAB (+) SUDAH DIHAPUS TOTAL sesuai rikuesmu!
      ),
    );
  }

  Widget _buildProjectList(List<ProjectModel> projects) {
    if (projects.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada laporan proyek.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _buildListCard(projects[index]);
      },
    );
  }

  Widget _buildListCard(ProjectModel project) {
    final Color statusColor = project.status == 'Selesai'
        ? const Color(0xFF2563EB)
        : const Color(0xFF16A34A);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DataReportDetailPage(project: project),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        project.location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        project.status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildProgressRow(
              label: 'Pengawasan',
              value: project.targetProgress,
              color: const Color(0xFF16A34A),
            ),
            const SizedBox(height: 12),
            _buildProgressRow(
              label: 'Fisik',
              value: project.actualProgress,
              color: const Color(0xFF2563EB),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressRow({
    required String label,
    required double value,
    required Color color,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 8,
                  color: color,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${(value * 100).toInt()}%',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
