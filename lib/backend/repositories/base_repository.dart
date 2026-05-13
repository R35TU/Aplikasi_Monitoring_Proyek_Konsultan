// =============================================================
// FILE   : lib/backend/repositories/base_repository.dart
// TEKNIK : Parameterization / Generics
// -------------------------------------------------------------
// FUNGSI :
//   Abstract class generik BaseRepository<T> yang mendefinisikan
//   kontrak operasi CRUD standar untuk semua repository.
//   Setiap repository konkret meng-extend class ini.
//
// STRUKTUR :
//   abstract class BaseRepository<T> {
//     Future<List<T>> getAll();
//     Future<T?> getById(int id);
//     Future<int> add(T item);
//     Future<bool> update(int id, T item);
//     Future<bool> delete(int id);
//   }
//
// YANG MENG-EXTEND CLASS INI :
//   ProjectRepository extends BaseRepository<ProjectModel>
//   ReportRepository  extends BaseRepository<ReportModel>
//   UserRepository    extends BaseRepository<UserModel>
//
// MANFAAT GENERICS :
//   Satu abstract class berlaku untuk semua tipe model
//   tanpa menulis ulang signature yang sama berkali-kali.
// =============================================================
