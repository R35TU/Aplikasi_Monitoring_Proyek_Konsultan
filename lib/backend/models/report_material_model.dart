
class ReportMaterialModel {
  final int reportMaterialsId;
  final int reportId;
  final String namaMaterial;
  final String satuan;
  final double volume;

  ReportMaterialModel({
    required this.reportMaterialsId,
    required this.reportId,
    required this.namaMaterial,
    required this.satuan,
    required this.volume,
  });

}
