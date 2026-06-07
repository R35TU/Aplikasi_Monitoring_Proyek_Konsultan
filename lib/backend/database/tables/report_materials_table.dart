import 'package:drift/drift.dart';
import 'reports_table.dart';

class ReportMaterials extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reportId => integer().references(Reports, #id)();
  TextColumn get namaMaterial => text()();
  TextColumn get satuan => text()();
  RealColumn get volume => real()();
}
