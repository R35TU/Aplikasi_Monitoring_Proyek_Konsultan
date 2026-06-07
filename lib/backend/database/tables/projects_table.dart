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
  RealColumn get targetProgress => real().withDefault(const Constant(0.0))();
  RealColumn get actualProgress => real().withDefault(const Constant(0.0))();
  TextColumn get imagePath => text().nullable()();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get sumberDana => text().nullable()();
  TextColumn get namaPemilik => text().nullable()();
}
