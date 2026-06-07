import 'package:flutter/material.dart';

class ReportSummaryPage extends StatelessWidget {
  const ReportSummaryPage({super.key});

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
        title: const Text('Buat Rekap Laporan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          _buildOptionCard(
            title: 'Mingguan',
            subtitle: 'Rekap laporan per minggu',
            icon: Icons.calendar_view_week,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportSummaryDetailPage(type: 'Mingguan')),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            title: 'Bulanan',
            subtitle: 'Rekap laporan per bulan',
            icon: Icons.calendar_month,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportSummaryDetailPage(type: 'Bulanan')),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            title: 'Custom',
            subtitle: 'Pilih rentang tanggal sendiri',
            icon: Icons.date_range,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportSummaryDetailPage(type: 'Custom')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF3B82F6)),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportSummaryDetailPage extends StatefulWidget {
  final String type;
  const ReportSummaryDetailPage({super.key, required this.type});

  @override
  State<ReportSummaryDetailPage> createState() => _ReportSummaryDetailPageState();
}

class _ReportSummaryDetailPageState extends State<ReportSummaryDetailPage> {
  String _selectedProject = 'Pembangunan Kuil Api';
  DateTime _startDate = DateTime(2026, 1, 1);
  DateTime _endDate = DateTime(2026, 1, 7);
  int _selectedMonth = 1;
  int _selectedYear = 2026;
  int _customRangeDays = 30;

  @override
  void initState() {
    super.initState();
    _syncTypeDefaults();
  }

  void _syncTypeDefaults() {
    if (widget.type == 'Mingguan') {
      _startDate = DateTime(2026, 1, 1);
      _endDate = _startDate.add(const Duration(days: 6));
    } else if (widget.type == 'Bulanan') {
      _selectedMonth = 1;
      _selectedYear = 2026;
    } else {
      _startDate = DateTime(2026, 1, 1);
      _endDate = DateTime(2026, 1, 31);
      _customRangeDays = 30;
    }
  }

  Future<void> _pickStartDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) {
      setState(() {
        _startDate = d;
        if (widget.type == 'Mingguan') {
          _endDate = _startDate.add(const Duration(days: 6));
        } else if (widget.type == 'Custom') {
          _endDate = _startDate.add(Duration(days: _customRangeDays - 1));
        }
      });
    }
  }

  Future<void> _pickEndDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: DateTime(2100),
    );
    if (d != null) {
      setState(() {
        _endDate = d;
        _customRangeDays = _endDate.difference(_startDate).inDays + 1;
      });
    }
  }

  void _updateCustomRange(int days) {
    setState(() {
      _customRangeDays = days;
      _endDate = _startDate.add(Duration(days: days - 1));
    });
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
        title: Text('Buat Rekap Laporan - ${widget.type}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        children: [
          const Text('Proyek', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedProject,
            items: const [
              DropdownMenuItem(value: 'Pembangunan Kuil Api', child: Text('Pembangunan Kuil Api')),
              DropdownMenuItem(value: 'Pembangunan Jalan Moon', child: Text('Pembangunan Jalan Moon')),
            ],
            onChanged: (value) => setState(() => _selectedProject = value ?? _selectedProject),
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          const SizedBox(height: 16),
          if (widget.type == 'Mingguan') ...[
            const Text('Tanggal Mulai', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDateInput(label: _formatDate(_startDate), onTap: _pickStartDate),
            const SizedBox(height: 16),
            const Text('Tanggal Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDateInput(label: _formatDate(_endDate), onTap: null, enabled: false),
          ] else if (widget.type == 'Bulanan') ...[
            const Text('Bulan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildMonthSelector(),
          ] else ...[
            const Text('Tanggal Mulai', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDateInput(label: _formatDate(_startDate), onTap: _pickStartDate),
            const SizedBox(height: 16),
            const Text('Tanggal Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDateInput(label: _formatDate(_endDate), onTap: _pickEndDate),
            const SizedBox(height: 16),
            Text('Rentang Cepat ($_customRangeDays Hari)', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildRangeButton('7 Hari', 7)),
                const SizedBox(width: 8),
                Expanded(child: _buildRangeButton('30 Hari', 30)),
                const SizedBox(width: 8),
                Expanded(child: _buildRangeButton('90 Hari', 90)),
              ],
            ),
          ],
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Buat Rekapan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateInput({required String label, required VoidCallback? onTap, bool enabled = true}) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: enabled ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(color: enabled ? Colors.black : Colors.grey.shade600)),
            const Icon(Icons.calendar_today, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonFormField<int>(
        value: _selectedMonth,
        onChanged: (value) => setState(() => _selectedMonth = value ?? _selectedMonth),
        decoration: const InputDecoration(border: InputBorder.none),
        items: List.generate(12, (index) {
          final month = index + 1;
          return DropdownMenuItem(value: month, child: Text(_monthName(month)));
        }),
      ),
    );
  }

  Widget _buildRangeButton(String label, int days) {
    final bool active = _customRangeDays == days;
    return ElevatedButton(
      onPressed: () => _updateCustomRange(days),
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? const Color(0xFF2563EB) : Colors.white,
        foregroundColor: active ? Colors.white : Colors.black,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(label),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day} ${_monthName(date.month)} ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }
}
