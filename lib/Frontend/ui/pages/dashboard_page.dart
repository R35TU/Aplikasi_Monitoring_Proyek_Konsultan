import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Frontend/providers/dashboard_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [Icon(Icons.notifications_none), SizedBox(width: 16)],
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Profil
                const Row(
                  children: [
                    CircleAvatar(radius: 25, backgroundColor: Colors.grey),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selamat datang,", style: TextStyle(color: Colors.grey)),
                        Text("Konsultan Kantor", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),

                // Grid Statistik
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.4,
                  children: [
                    _statCard("Total Proyek", provider.totalProyek.toString(), Icons.people, Colors.blue),
                    _statCard("On Progress", "12", Icons.refresh, Colors.teal),
                    _statCard("Selesai", "8", Icons.check_circle_outline, Colors.green),
                    _statCard("Terlambat", "4", Icons.exit_to_app, Colors.orange),
                  ],
                ),
                const SizedBox(height: 25),

                // List Proyek Section
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Proyek On Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Lihat Semua", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 15),
                
                provider.listNamaProyek.isEmpty 
                  ? _buildEmptyState()
                  : Column(children: [_proyekItem("Gedung Kantor", 0.65)]),

                const SizedBox(height: 25),

                // Donut Chart Section
                _buildProgressChart(provider),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget untuk Donut Chart dan Legenda
  Widget _buildProgressChart(DashboardProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Progress Proyek", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              // Donut Chart menggunakan Stack untuk teks di tengah
              SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 45,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(color: Colors.greenAccent[700], value: 8, radius: 15, showTitle: false),
                          PieChartSectionData(color: Colors.tealAccent[400], value: 12, radius: 15, showTitle: false),
                          PieChartSectionData(color: Colors.redAccent, value: 4, radius: 15, showTitle: false),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${provider.totalProyek}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          const Text("Total Proyek", style: TextStyle(fontSize: 9, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              // Legenda
              Expanded(
                child: Column(
                  children: [
                    _chartLegend(Colors.greenAccent[700]!, "Selesai (8)"),
                    _chartLegend(Colors.tealAccent[400]!, "On Progress (12)"),
                    _chartLegend(Colors.redAccent, "Terlambat (4)"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chartLegend(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _statCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              Icon(icon, color: color.withValues(alpha: 0.2), size: 20),
            ],
          ),
          Text(count, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(Icons.storage, size: 50, color: Colors.grey.withValues(alpha: 0.5)),
          const SizedBox(height: 10),
          const Text("Belum ada data di Database SQL", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _proyekItem(String name, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: progress, 
              color: Colors.blue, 
              backgroundColor: Colors.grey[200],
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}