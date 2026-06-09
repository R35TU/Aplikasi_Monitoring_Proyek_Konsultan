class ReportModel {
  final int? id;
  final int projectId;
  final String? pembuatId;
  final String? penyetujuId;
  final String? jenisLaporan;
  final DateTime createdAt; // tanggal
  final String? cuaca;
  final int? jumlahPekerja;
  final String? deskripsi;
  final String statusPersetujuan;

  ReportModel({
    this.id,
    required this.projectId,
    this.pembuatId,
    this.penyetujuId,
    this.jenisLaporan,
    required this.createdAt,
    this.cuaca,
    this.jumlahPekerja,
    this.deskripsi,
    required this.statusPersetujuan,
  }) {
    assert(projectId > 0, 'projectId tidak valid');
    assert(!createdAt.isAfter(DateTime.now()), 'Tanggal tidak valid');
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      projectId: json['proyek_id'] ?? 0,
      pembuatId: json['pembuat_id'],
      penyetujuId: json['penyetuju_id'],
      jenisLaporan: json['jenis_laporan'],
      createdAt: json['tanggal'] != null ? DateTime.parse(json['tanggal']) : DateTime.now(),
      cuaca: json['cuaca'],
      jumlahPekerja: json['jumlah_pekerja'],
      deskripsi: json['deskripsi'],
      statusPersetujuan: json['status_persetujuan'] ?? 'draft',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'proyek_id': projectId,
      'pembuat_id': pembuatId,
      'penyetuju_id': penyetujuId,
      'jenis_laporan': jenisLaporan,
      'tanggal': createdAt.toIso8601String(),
      'cuaca': cuaca,
      'jumlah_pekerja': jumlahPekerja,
      'deskripsi': deskripsi,
      'status_persetujuan': statusPersetujuan,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}
