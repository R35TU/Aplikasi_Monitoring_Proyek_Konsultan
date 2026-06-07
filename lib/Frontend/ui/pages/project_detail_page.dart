import 'package:flutter/material.dart';

import '../../../backend/models/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailPage({super.key, required this.project});

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
            'Detail Proyek',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: const TabBar(
                labelColor: Color(0xFF0055FF),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFF0055FF),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                tabs: [
                  Tab(text: 'Umum'),
                  Tab(text: 'Administrasi'),
                  Tab(text: 'Progres'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGeneralInfo(context),
                  _buildAdministrationTab(context),
                  _buildProgressTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdministrationTab(BuildContext context) {
    final documents = [
      {
        'title': 'Dokumen Pra Kontrak',
        'subtitle': '3 File',
        'selected': true,
        'files': ['LOREMISPUM.pdf', 'BeritaAcara.txt', 'SuratKontrak.pdf'],
      },
      {'title': 'Dokumen Kontrak', 'subtitle': '8 File', 'selected': false},
      {'title': 'PCM', 'subtitle': '2 File', 'selected': false},
      {'title': 'Adendum', 'subtitle': '1 File', 'selected': false},
      {'title': 'Addset', 'subtitle': '3 File', 'selected': false},
      {'title': 'Request of Work', 'subtitle': '1 File', 'selected': false},
      {'title': 'Soft Drawing', 'subtitle': '1 File', 'selected': false},
      {'title': 'Surat Pengunduran Diri', 'subtitle': '2 File', 'selected': false},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: documents.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final doc = documents[index];
        final bool selected = doc['selected'] as bool;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFE8F0FF) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: selected ? const Color(0xFF0055FF) : const Color(0xFFE5E5EA),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.folder,
                    color: selected ? const Color(0xFF0055FF) : const Color(0xFFB0B0B0),
                    size: 24,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc['title'] as String,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: selected ? const Color(0xFF0055FF) : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          doc['subtitle'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: selected ? const Color(0xFF0055FF).withValues(alpha: 0.9) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: selected ? const Color(0xFF0055FF) : Colors.grey,
                  ),
                ],
              ),
            ),
            if (selected) const SizedBox(height: 12),
            if (selected)
              Column(
                children: (doc['files'] as List<String>).map((file) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E5EA)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.picture_as_pdf, color: Color(0xFF0055FF), size: 18),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            file,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Text('PDF', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildProgressTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressLabel('Progres Pengawasan', 0.8, const Color(0xFF0055FF)),
          const SizedBox(height: 20),
          _buildProgressLabel('Progres Fisik', 0.5, Colors.green),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final day = index + 1;
                      return _buildDateButton(day, index == 0);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  SizedBox(height: 4),
                  Text('Januari 2026', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E5EA)),
            ),
            child: Column(
              children: [
                _buildProgressTableHeader(),
                _buildProgressTableRow('Pengawasan', true, '4,5%', const Color(0xFFE8F8EE)),
                _buildProgressTableRow('Fisik', false, '0%', const Color(0xFFEFF5FF)),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildDateButton(int day, bool selected) {
    return Container(
      width: 48,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0055FF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: selected ? const Color(0xFF0055FF) : const Color(0xFFE5E5EA)),
      ),
      child: Center(
        child: Text(
          day.toString().padLeft(2, '0'),
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5EA))),
      ),
      child: Row(
        children: const [
          Expanded(child: Text('Progres', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(child: Text('Laporan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(child: Text('Peningkatan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _buildProgressTableRow(String label, bool hasReport, String improvement, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: const Border(bottom: BorderSide(color: Color(0xFFE5E5EA))),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
          Expanded(
            child: Center(
              child: hasReport
                  ? const Icon(Icons.check_circle, color: Color(0xFF0055FF), size: 18)
                  : const Icon(Icons.remove_circle_outline, color: Colors.grey, size: 18),
            ),
          ),
          Expanded(
            child: Text(
              improvement,
              style: TextStyle(
                color: hasReport ? const Color(0xFF0055FF) : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralInfo(BuildContext context) {
    final Color statusColor = project.status == 'Selesai' ? const Color(0xFF0055FF) : Colors.green;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.asset(
                  project.imagePath,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 5, backgroundColor: statusColor),
                      const SizedBox(width: 8),
                      Text(
                        project.status,
                        style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey, size: 16),
                    const SizedBox(width: 6),
                    Text(project.location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(width: 12),
                    Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
                    const SizedBox(width: 12),
                    const Icon(Icons.shield, color: Colors.grey, size: 16),
                    const SizedBox(width: 6),
                    const Text('Jenis Pengawasan', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildSmallInfoCard('Tanggal Mulai', project.tanggalMulai == null || project.tanggalMulai!.isEmpty ? '1 Januari 2026' : project.tanggalMulai!)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildSmallInfoCard('Tanggal Selesai', project.tanggalSelesai == null || project.tanggalSelesai!.isEmpty ? '30 Februari 2026' : project.tanggalSelesai!)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDetailInfoCard('Pemilik Proyek', project.namaPemilik == null || project.namaPemilik!.isEmpty ? 'Pemerintah Kabupaten Banyumas' : project.namaPemilik!),
                const SizedBox(height: 12),
                _buildDetailInfoCard('Sumber Dana', project.sumberDana == null || project.sumberDana!.isEmpty ? 'APBD 2026' : project.sumberDana!),
                const SizedBox(height: 12),
                _buildDetailInfoCard('Konsultan Pengawas', 'CV. Tata Saka Consultant'),
                const SizedBox(height: 12),
                _buildDetailInfoCard('Kontraktor Pelaksana', project.kontraktorId == null || project.kontraktorId!.isEmpty ? 'PT. Maju Mundur Jaya' : project.kontraktorId!),
                const SizedBox(height: 12),
                _buildDetailInfoCard(
                    'Deskripsi',
                    project.deskripsi == null || project.deskripsi!.isEmpty
                        ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                        : project.deskripsi!),
                const SizedBox(height: 24),
                const Text('Tim Proyek', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTeamMember('Aradea S.', 'Konsultan'),
                      _buildTeamMember('Evos E.', 'Kontraktor'),
                      _buildTeamMember('Alter Ego', 'Eksternal'),
                      _buildTeamMember('Onic P.', 'Konsultan'),
                      _buildTeamMember('Aura Fir', 'Dinas'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Foto Dokumentasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                  children: List.generate(
                    6,
                    (index) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        project.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallInfoCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E5EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDetailInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E5EA)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLabel(String title, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text('${(value * 100).toInt()}%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: const Color(0xFFEAF0FF),
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }



  Widget _buildTeamMember(String name, String role) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFFE8F0FF),
            child: Text(name[0], style: const TextStyle(color: Color(0xFF0055FF), fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0055FF).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              role,
              style: const TextStyle(color: Color(0xFF0055FF), fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
