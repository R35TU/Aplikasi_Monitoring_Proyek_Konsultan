class DocumentModel {
  final int? id;
  final int proyekId;
  final String? uploaderId;
  final String tipeDokumen;
  final String fileUrl;
  final String status;
  final DateTime tanggalUpload;

  DocumentModel({
    this.id,
    required this.proyekId,
    this.uploaderId,
    required this.tipeDokumen,
    required this.fileUrl,
    required this.status,
    required this.tanggalUpload,
  });
}
