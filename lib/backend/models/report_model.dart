
class ReportModel {
  final int id;
  final int proyekId;
  final String pembuatId;
  final String? penyetujuId;
  final String jenisLaporan;
  final String tanggal;
  final String? cuaca;
  final int? jumlahPekerja;
  final String? deskripsi;
  final String statusPersetujuan;

  ReportModel({
    required this.id,
    required this.proyekId,
    required this.pembuatId,
    this.penyetujuId,
    required this.jenisLaporan,
    required this.tanggal,
    this.cuaca,
    this.jumlahPekerja,
    this.deskripsi,
    required this.statusPersetujuan,
  });

}
