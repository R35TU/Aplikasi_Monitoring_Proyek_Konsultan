// =============================================================
// FILE   : lib/backend/repositories/base_repository.dart
// TEKNIK : Parameterization / Generics
// =============================================================

abstract class BaseRepository<T, InsertType> {
  Future<List<T>> getAll();
  Future<T?> getById(int id);
  Future<int> add(InsertType item);
  Future<bool> updateItem(int id, InsertType item);
  Future<bool> deleteItem(int id);
}
