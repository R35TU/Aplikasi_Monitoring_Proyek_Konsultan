import 'package:flutter/material.dart';

// =============================================================
// FILE   : lib/Frontend/core/constants/status_config.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Tabel konfigurasi UI untuk setiap nilai status.
//   Memetakan string status ke properti tampilan (warna, label, icon)
//   sehingga UI tidak perlu pakai if-else panjang.
// =============================================================

class StatusConfig {
  final Color color;
  final String label;
  final IconData icon;

  const StatusConfig({
    required this.color,
    required this.label,
    required this.icon,
  });
}

const Map<String, StatusConfig> statusConfigMap = {
  'draft': StatusConfig(color: Colors.grey, label: 'Draft', icon: Icons.edit),
  'submitted': StatusConfig(color: Colors.blue, label: 'Dikirim', icon: Icons.send),
  'approved': StatusConfig(color: Colors.green, label: 'Disetujui', icon: Icons.check_circle_outline),
  'rejected': StatusConfig(color: Colors.red, label: 'Ditolak', icon: Icons.error_outline),
  'Perencanaan': StatusConfig(color: Colors.orange, label: 'Perencanaan', icon: Icons.calendar_today),
  'Progres': StatusConfig(color: Colors.blue, label: 'Progres', icon: Icons.trending_up),
  'Berjalan': StatusConfig(color: Colors.blue, label: 'Berjalan', icon: Icons.play_arrow),
  'Selesai': StatusConfig(color: Colors.teal, label: 'Selesai', icon: Icons.done_all),
  'Dibatalkan': StatusConfig(color: Colors.red, label: 'Dibatalkan', icon: Icons.cancel_outlined),
};
