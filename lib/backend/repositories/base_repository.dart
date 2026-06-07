// =============================================================
// FILE   : lib/backend/repositories/base_repository.dart
// TEKNIK : Parameterization / Generics
// -------------------------------------------------------------
// FUNGSI :
//   Abstract class generik BaseRepository<T, ID> yang mendefinisikan
//   kontrak operasi CRUD standar untuk semua repository.
//   Setiap repository konkret meng-extend class ini.
// =============================================================

abstract class BaseRepository<T, ID> {
  Future<List<T>> getAll();
  Future<T?> getById(ID id);
  Future<ID> add(T item);
  Future<bool> update(ID id, T item);
  Future<bool> delete(ID id);
}
