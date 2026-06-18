import 'package:flutter/material.dart';

class ConfirmationRequestPage extends StatelessWidget {
  const ConfirmationRequestPage({super.key});

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
            'Konfirmasi Laporan',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: const Color(0xFF2563EB),
            labelColor: const Color(0xFF2563EB),
            unselectedLabelColor: Colors.grey.shade500,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Menunggu'),
              Tab(text: 'Disetujui'),
              Tab(text: 'Ditolak'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ConfirmationList(status: 'Menunggu'),
            _ConfirmationList(status: 'Disetujui'),
            _ConfirmationList(status: 'Ditolak'),
          ],
        ),
      ),
    );
  }
}

class _ConfirmationList extends StatelessWidget {
  final String status;
  const _ConfirmationList({required this.status});

  List<Map<String, String>> get _items {
    if (status == 'Menunggu') {
      return [
        {
          'title': 'Pembangunan Jalan ABC',
          'company': 'PT. Hebat Sehat',
          'date': '01/01/2026',
          'progress': '65%',
          'badge': 'Menunggu',
          'badgeColor': '0xFFFDE7E9',
          'badgeTextColor': '0xFFEA580C',
        },
        {
          'title': 'Pembangunan Jembatan Konohagakure',
          'company': 'PT. Keren Sekali Yah',
          'date': '01/01/2026',
          'progress': '65%',
          'badge': 'Menunggu',
          'badgeColor': '0xFFFDE7E9',
          'badgeTextColor': '0xFFEA580C',
        },
      ];
    }
    if (status == 'Disetujui') {
      return [
        {
          'title': 'Pembangunan Kuil Negara Api',
          'company': 'PT. Daimyo Api',
          'date': '01/01/2026',
          'progress': '65%',
          'badge': 'Disetujui',
          'badgeColor': '0xFFE6F4EA',
          'badgeTextColor': '0xFF15803D',
        },
        {
          'title': 'Renovasi Kantor Hokage',
          'company': 'PT. Jounin Konoha',
          'date': '01/01/2026',
          'progress': '65%',
          'badge': 'Disetujui',
          'badgeColor': '0xFFE6F4EA',
          'badgeTextColor': '0xFF15803D',
        },
      ];
    }
    return [
      {
        'title': 'Restorasi Tembok Kuno',
        'company': 'PT. Siap Ambyar',
        'date': '01/01/2026',
        'progress': '65%',
        'badge': 'Ditolak',
        'badgeColor': '0xFFFCE7F3',
        'badgeTextColor': '0xFFBE123C',
      },
      {
        'title': 'Perbaikan Bendungan Suci',
        'company': 'PT. Air Deras',
        'date': '01/01/2026',
        'progress': '65%',
        'badge': 'Ditolak',
        'badgeColor': '0xFFFCE7F3',
        'badgeTextColor': '0xFFBE123C',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    if (items.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada laporan $status',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['company']!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
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
                      color: Color(int.parse(item['badgeColor']!)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item['badge']!,
                      style: TextStyle(
                        color: Color(int.parse(item['badgeTextColor']!)),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item['date']!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.visibility, size: 16, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    item['progress']!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
