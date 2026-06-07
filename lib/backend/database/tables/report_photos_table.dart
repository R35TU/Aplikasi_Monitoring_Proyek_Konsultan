import 'package:drift/drift.dart';
import 'reports_table.dart';

class ReportPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reportId => integer().references(Reports, #id)();
  TextColumn get fotoUrl => text()();
}
