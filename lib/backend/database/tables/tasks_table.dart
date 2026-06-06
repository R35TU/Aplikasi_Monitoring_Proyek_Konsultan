import 'package:drift/drift.dart';
import 'reports_table.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reportId =>
      integer().references(Reports, #id, onDelete: KeyAction.cascade)();
  TextColumn get namaPekerjaan => text().withLength(min: 1, max: 150)();
  BoolColumn get isSelesai => boolean().withDefault(const Constant(false))();
}
