
class ProjectDocumentModel {
  final int projectDocumentId;
  final int proyekId;
  final int folderId;
  final String namaFile;
  final String fileUrl;
  final String diunggahOleh;
  final String tanggalUnggah;

  ProjectDocumentModel({
    required this.projectDocumentId,
    required this.proyekId,
    required this.folderId,
    required this.namaFile,
    required this.fileUrl,
    required this.diunggahOleh,
    required this.tanggalUnggah,
  });

  // 2. Builder Pattern (Creational)
  // Menyediakan cara untuk membangun objek ProjectDocumentModel secara bertahap.
  static ProjectDocumentBuilder builder() => ProjectDocumentBuilder();
}

class ProjectDocumentBuilder {
  int? _projectDocumentId;
  int? _proyekId;
  int? _folderId;
  String? _namaFile;
  String? _fileUrl;
  String? _diunggahOleh;
  String? _tanggalUnggah;

  ProjectDocumentBuilder setProjectDocumentId(int id) {
    _projectDocumentId = id;
    return this;
  }

  ProjectDocumentBuilder setProyekId(int id) {
    _proyekId = id;
    return this;
  }

  ProjectDocumentBuilder setFolderId(int id) {
    _folderId = id;
    return this;
  }

  ProjectDocumentBuilder setNamaFile(String name) {
    _namaFile = name;
    return this;
  }

  ProjectDocumentBuilder setFileUrl(String url) {
    _fileUrl = url;
    return this;
  }

  ProjectDocumentBuilder setDiunggahOleh(String uploader) {
    _diunggahOleh = uploader;
    return this;
  }

  ProjectDocumentBuilder setTanggalUnggah(String date) {
    _tanggalUnggah = date;
    return this;
  }

  ProjectDocumentModel build() {
    if (_projectDocumentId == null ||
        _proyekId == null ||
        _folderId == null ||
        _namaFile == null ||
        _fileUrl == null ||
        _diunggahOleh == null ||
        _tanggalUnggah == null) {
      throw Exception("All fields must be set before building ProjectDocumentModel");
    }
    return ProjectDocumentModel(
      projectDocumentId: _projectDocumentId!,
      proyekId: _proyekId!,
      folderId: _folderId!,
      namaFile: _namaFile!,
      fileUrl: _fileUrl!,
      diunggahOleh: _diunggahOleh!,
      tanggalUnggah: _tanggalUnggah!,
    );
  }
}
