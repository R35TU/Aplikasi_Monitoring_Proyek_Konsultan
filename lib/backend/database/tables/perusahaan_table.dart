import 'package:drift/drift.dart';

class Perusahaan extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaPerusahaan => text()();
  TextColumn get alamat => text().nullable()();
}
