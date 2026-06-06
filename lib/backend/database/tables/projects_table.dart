import 'package:drift/drift.dart';

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaProyek => text().withLength(min: 1, max: 200)();
  TextColumn get lokasi => text().nullable()();
  TextColumn get tanggalMulai => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('Perencanaan'))();
}
