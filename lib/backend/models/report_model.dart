class ReportModel {
  final int reportsId;
  final int proyekId;
  final String pembuatId;
  final String? penyatujuId;
  final String jenisLaporan;
  final String tanggal;
  final String? cuaca;
  final int? jumlahPekerja;
  final String? deskripsi;
  final String statusPersetujuan;

  ReportModel({
    required this.reportsId,
    required this.proyekId,
    required this.pembuatId,
    this.penyatujuId,
    required this.jenisLaporan,
    required this.tanggal,
    this.cuaca,
    this.jumlahPekerja,
    this.deskripsi,
    required this.statusPersetujuan,
  });
}
