// =============================================================
// FILE   : lib/Frontend/core/constants/status_config.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Tabel konfigurasi UI untuk setiap nilai status.
//   Memetakan string status ke properti tampilan (warna, label, icon)
//   sehingga UI tidak perlu pakai if-else panjang.
//
// STRUKTUR :
//   class StatusConfig {
//     final Color color;
//     final String label;
//     final IconData icon;
//   }
//
//   const Map<String, StatusConfig> statusConfigMap = {
//     'draft'     : StatusConfig(color: Colors.grey,   label: 'Draft',     icon: Icons.edit),
//     'submitted' : StatusConfig(color: Colors.blue,   label: 'Dikirim',   icon: Icons.send),
//     'approved'  : StatusConfig(color: Colors.green,  label: 'Disetujui', icon: Icons.check),
//     'rejected'  : StatusConfig(color: Colors.red,    label: 'Ditolak',   icon: Icons.close),
//     'aktif'     : StatusConfig(color: Colors.orange, label: 'Aktif',     icon: Icons.work),
//     'selesai'   : StatusConfig(color: Colors.teal,   label: 'Selesai',   icon: Icons.done_all),
//   };
//
// CARA PAKAI :
//   final config = statusConfigMap[status];
//   Icon(config.icon, color: config.color)
// =============================================================
