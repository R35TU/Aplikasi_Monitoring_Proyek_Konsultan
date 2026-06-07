import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/user_model.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository<UserModel, String> {
  final AppDatabase db;

  UserRepository(this.db);

  UserModel _toModel(User user) {
    return UserModel(
      id: user.firebaseUid,
      name: user.nama,
      email: user.username ?? '',
      role: user.peran,
      nomorHp: user.nomorHp,
    );
  }

  @override
  Future<List<UserModel>> getAll() async {
    final users = await db.select(db.users).get();
    return users.map(_toModel).toList();
  }

  @override
  Future<UserModel?> getById(String id) async {
    final query = db.select(db.users)..where((t) => t.firebaseUid.equals(id));
    final user = await query.getSingleOrNull();
    if (user == null) return null;
    return _toModel(user);
  }

  Future<UserModel?> getByEmail(String email) async {
    final query = db.select(db.users)..where((t) => t.username.equals(email));
    final user = await query.getSingleOrNull();
    if (user == null) return null;
    return _toModel(user);
  }

  Future<UserModel?> authenticate(String email, String password) async {
    final query = db.select(db.users)
      ..where((t) => t.username.equals(email) & t.password.equals(password));
    final user = await query.getSingleOrNull();
    if (user == null) return null;
    return _toModel(user);
  }

  @override
  Future<String> add(UserModel item) async {
    // Defensive Programming assertions
    assert(item.name.isNotEmpty, 'Nama tidak boleh kosong');

    await db.into(db.users).insert(
          UsersCompanion.insert(
            firebaseUid: item.id,
            nama: item.name,
            username: Value(item.email),
            peran: item.role,
            nomorHp: Value(item.nomorHp),
            password: const Value(null), // By default, password is set separately or null
          ),
        );
    return item.id;
  }

  Future<void> registerWithPassword(UserModel item, String password) async {
    assert(item.name.isNotEmpty, 'Nama tidak boleh kosong');
    assert(password.length >= 6, 'Password minimal 6 karakter');

    await db.into(db.users).insert(
          UsersCompanion.insert(
            firebaseUid: item.id,
            nama: item.name,
            username: Value(item.email),
            peran: item.role,
            nomorHp: Value(item.nomorHp),
            password: Value(password),
          ),
        );
  }

  @override
  Future<bool> update(String id, UserModel item) async {
    assert(item.name.isNotEmpty, 'Nama tidak boleh kosong');

    final count = await (db.update(db.users)
          ..where((t) => t.firebaseUid.equals(id)))
        .write(
      UsersCompanion(
        nama: Value(item.name),
        username: Value(item.email),
        peran: Value(item.role),
        nomorHp: Value(item.nomorHp),
      ),
    );
    return count > 0;
  }

  @override
  Future<bool> delete(String id) async {
    final count = await (db.delete(db.users)
          ..where((t) => t.firebaseUid.equals(id)))
        .go();
    return count > 0;
  }
}
