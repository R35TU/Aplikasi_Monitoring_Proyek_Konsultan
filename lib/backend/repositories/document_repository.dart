import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/document_model.dart';
import 'base_repository.dart';

class DocumentRepository extends BaseRepository<DocumentModel, int> {
  final AppDatabase db;

  DocumentRepository(this.db);

  DocumentModel _toModel(ProjectDocument d) {
    return DocumentModel(
      id: d.id,
      proyekId: d.proyekId,
      uploaderId: d.diunggahOleh,
      tipeDokumen: d.folderId.toString(),
      fileUrl: d.fileUrl,
      status: 'active',
      tanggalUpload: DateTime.tryParse(d.tanggalUnggah) ?? DateTime.now(),
    );
  }

  @override
  Future<List<DocumentModel>> getAll() async {
    final docs = await db.select(db.projectDocuments).get();
    return docs.map(_toModel).toList();
  }

  @override
  Future<DocumentModel?> getById(int id) async {
    final query = db.select(db.projectDocuments)..where((t) => t.id.equals(id));
    final doc = await query.getSingleOrNull();
    if (doc == null) return null;
    return _toModel(doc);
  }

  Future<List<DocumentModel>> getByProjectId(int projectId) async {
    final query = db.select(db.projectDocuments)..where((t) => t.proyekId.equals(projectId));
    final docs = await query.get();
    return docs.map(_toModel).toList();
  }

  @override
  Future<int> add(DocumentModel item) async {
    assert(item.fileUrl.isNotEmpty, 'URL file tidak boleh kosong');

    final folderIdVal = int.tryParse(item.tipeDokumen) ?? 1;

    final id = await db.into(db.projectDocuments).insert(
          ProjectDocumentsCompanion.insert(
            proyekId: item.proyekId,
            folderId: folderIdVal,
            namaFile: item.fileUrl.split('/').last,
            fileUrl: item.fileUrl,
            diunggahOleh: item.uploaderId ?? '',
            tanggalUnggah: item.tanggalUpload.toIso8601String(),
          ),
        );
    return id;
  }

  @override
  Future<bool> update(int id, DocumentModel item) async {
    assert(item.fileUrl.isNotEmpty, 'URL file tidak boleh kosong');
    final folderIdVal = int.tryParse(item.tipeDokumen) ?? 1;

    final count = await (db.update(db.projectDocuments)..where((t) => t.id.equals(id))).write(
      ProjectDocumentsCompanion(
        proyekId: Value(item.proyekId),
        folderId: Value(folderIdVal),
        namaFile: Value(item.fileUrl.split('/').last),
        fileUrl: Value(item.fileUrl),
        diunggahOleh: Value(item.uploaderId ?? ''),
        tanggalUnggah: Value(item.tanggalUpload.toIso8601String()),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(int id) async {
    final count = await (db.delete(db.projectDocuments)..where((t) => t.id.equals(id))).go();
    return count > 0;
  }
}
