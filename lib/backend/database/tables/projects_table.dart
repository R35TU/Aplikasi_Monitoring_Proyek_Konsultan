import 'package:drift/drift.dart';
import 'users_table.dart';

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaProyek => text().withLength(min: 1, max: 200)();
  TextColumn get lokasi => text().nullable()();
  TextColumn get kategori => text().nullable()(); // Bina Marga, Cipta Karya, SDA
  TextColumn get tanggalMulai => text().nullable()();
  TextColumn get tanggalSelesai => text().nullable()();
  RealColumn get nilaiKontrak => real().nullable()();
  TextColumn get kontraktorId => text().nullable().references(
    Users,
    #firebaseUid,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get dinasId => text().nullable().references(
    Users,
    #firebaseUid,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get status => text().withDefault(const Constant('Perencanaan'))();
}
