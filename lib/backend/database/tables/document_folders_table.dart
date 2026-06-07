import 'package:drift/drift.dart';

class DocumentFolders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaFolder => text()();
  TextColumn get kategori => text().nullable()();
}
