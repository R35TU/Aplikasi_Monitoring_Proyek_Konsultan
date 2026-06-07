import 'package:flutter/material.dart';

class CreateSupervisionReportPage extends StatefulWidget {
  const CreateSupervisionReportPage({super.key});

  @override
  State<CreateSupervisionReportPage> createState() => _CreateSupervisionReportPageState();
}

class _CreateSupervisionReportPageState extends State<CreateSupervisionReportPage> {
  String? _selectedProject = 'Pembangunan Jembatan Alam';
  DateTime _selectedDate = DateTime(2026, 1, 1);
  final TextEditingController _activityController = TextEditingController(text: 'Pembangunan Jembatan Alam');
  final TextEditingController _workersController = TextEditingController(text: '13');
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
    _workersController.dispose();
    super.dispose();
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
            DropdownButtonFormField<String>(
              value: _selectedProject,
              items: const [
                DropdownMenuItem(value: 'Pembangunan Jembatan Alam', child: Text('Pembangunan Jembatan Alam')),
              ],
              onChanged: (v) => setState(() => _selectedProject = v),
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
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
                      const Text('Pekerja', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _workersController,
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
              child: ElevatedButton(
                onPressed: () {
                  // placeholder submit action
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Laporan disimpan (demo)')));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                child: const Text('Simpan Laporan', style: TextStyle(fontWeight: FontWeight.bold)),
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
