// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PerusahaanTable extends Perusahaan
    with TableInfo<$PerusahaanTable, PerusahaanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerusahaanTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaPerusahaanMeta = const VerificationMeta(
    'namaPerusahaan',
  );
  @override
  late final GeneratedColumn<String> namaPerusahaan = GeneratedColumn<String>(
    'nama_perusahaan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, namaPerusahaan, alamat];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'perusahaan';
  @override
  VerificationContext validateIntegrity(
    Insertable<PerusahaanData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_perusahaan')) {
      context.handle(
        _namaPerusahaanMeta,
        namaPerusahaan.isAcceptableOrUnknown(
          data['nama_perusahaan']!,
          _namaPerusahaanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaPerusahaanMeta);
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PerusahaanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PerusahaanData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      namaPerusahaan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_perusahaan'],
      )!,
      alamat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alamat'],
      ),
    );
  }

  @override
  $PerusahaanTable createAlias(String alias) {
    return $PerusahaanTable(attachedDatabase, alias);
  }
}

class PerusahaanData extends DataClass implements Insertable<PerusahaanData> {
  final int id;
  final String namaPerusahaan;
  final String? alamat;
  const PerusahaanData({
    required this.id,
    required this.namaPerusahaan,
    this.alamat,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_perusahaan'] = Variable<String>(namaPerusahaan);
    if (!nullToAbsent || alamat != null) {
      map['alamat'] = Variable<String>(alamat);
    }
    return map;
  }

  PerusahaanCompanion toCompanion(bool nullToAbsent) {
    return PerusahaanCompanion(
      id: Value(id),
      namaPerusahaan: Value(namaPerusahaan),
      alamat: alamat == null && nullToAbsent
          ? const Value.absent()
          : Value(alamat),
    );
  }

  factory PerusahaanData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PerusahaanData(
      id: serializer.fromJson<int>(json['id']),
      namaPerusahaan: serializer.fromJson<String>(json['namaPerusahaan']),
      alamat: serializer.fromJson<String?>(json['alamat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaPerusahaan': serializer.toJson<String>(namaPerusahaan),
      'alamat': serializer.toJson<String?>(alamat),
    };
  }

  PerusahaanData copyWith({
    int? id,
    String? namaPerusahaan,
    Value<String?> alamat = const Value.absent(),
  }) => PerusahaanData(
    id: id ?? this.id,
    namaPerusahaan: namaPerusahaan ?? this.namaPerusahaan,
    alamat: alamat.present ? alamat.value : this.alamat,
  );
  PerusahaanData copyWithCompanion(PerusahaanCompanion data) {
    return PerusahaanData(
      id: data.id.present ? data.id.value : this.id,
      namaPerusahaan: data.namaPerusahaan.present
          ? data.namaPerusahaan.value
          : this.namaPerusahaan,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PerusahaanData(')
          ..write('id: $id, ')
          ..write('namaPerusahaan: $namaPerusahaan, ')
          ..write('alamat: $alamat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaPerusahaan, alamat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PerusahaanData &&
          other.id == this.id &&
          other.namaPerusahaan == this.namaPerusahaan &&
          other.alamat == this.alamat);
}

class PerusahaanCompanion extends UpdateCompanion<PerusahaanData> {
  final Value<int> id;
  final Value<String> namaPerusahaan;
  final Value<String?> alamat;
  const PerusahaanCompanion({
    this.id = const Value.absent(),
    this.namaPerusahaan = const Value.absent(),
    this.alamat = const Value.absent(),
  });
  PerusahaanCompanion.insert({
    this.id = const Value.absent(),
    required String namaPerusahaan,
    this.alamat = const Value.absent(),
  }) : namaPerusahaan = Value(namaPerusahaan);
  static Insertable<PerusahaanData> custom({
    Expression<int>? id,
    Expression<String>? namaPerusahaan,
    Expression<String>? alamat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaPerusahaan != null) 'nama_perusahaan': namaPerusahaan,
      if (alamat != null) 'alamat': alamat,
    });
  }

  PerusahaanCompanion copyWith({
    Value<int>? id,
    Value<String>? namaPerusahaan,
    Value<String?>? alamat,
  }) {
    return PerusahaanCompanion(
      id: id ?? this.id,
      namaPerusahaan: namaPerusahaan ?? this.namaPerusahaan,
      alamat: alamat ?? this.alamat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaPerusahaan.present) {
      map['nama_perusahaan'] = Variable<String>(namaPerusahaan.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PerusahaanCompanion(')
          ..write('id: $id, ')
          ..write('namaPerusahaan: $namaPerusahaan, ')
          ..write('alamat: $alamat')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _peranMeta = const VerificationMeta('peran');
  @override
  late final GeneratedColumn<String> peran = GeneratedColumn<String>(
    'peran',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _perusahaanIdMeta = const VerificationMeta(
    'perusahaanId',
  );
  @override
  late final GeneratedColumn<int> perusahaanId = GeneratedColumn<int>(
    'perusahaan_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES perusahaan (id)',
    ),
  );
  static const VerificationMeta _nomorHpMeta = const VerificationMeta(
    'nomorHp',
  );
  @override
  late final GeneratedColumn<String> nomorHp = GeneratedColumn<String>(
    'nomor_hp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    firebaseUid,
    nama,
    username,
    peran,
    perusahaanId,
    nomorHp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firebaseUidMeta);
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    }
    if (data.containsKey('peran')) {
      context.handle(
        _peranMeta,
        peran.isAcceptableOrUnknown(data['peran']!, _peranMeta),
      );
    } else if (isInserting) {
      context.missing(_peranMeta);
    }
    if (data.containsKey('perusahaan_id')) {
      context.handle(
        _perusahaanIdMeta,
        perusahaanId.isAcceptableOrUnknown(
          data['perusahaan_id']!,
          _perusahaanIdMeta,
        ),
      );
    }
    if (data.containsKey('nomor_hp')) {
      context.handle(
        _nomorHpMeta,
        nomorHp.isAcceptableOrUnknown(data['nomor_hp']!, _nomorHpMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firebaseUid};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      ),
      peran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peran'],
      )!,
      perusahaanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}perusahaan_id'],
      ),
      nomorHp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nomor_hp'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String firebaseUid;
  final String nama;
  final String? username;
  final String peran;
  final int? perusahaanId;
  final String? nomorHp;
  const User({
    required this.firebaseUid,
    required this.nama,
    this.username,
    required this.peran,
    this.perusahaanId,
    this.nomorHp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firebase_uid'] = Variable<String>(firebaseUid);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    map['peran'] = Variable<String>(peran);
    if (!nullToAbsent || perusahaanId != null) {
      map['perusahaan_id'] = Variable<int>(perusahaanId);
    }
    if (!nullToAbsent || nomorHp != null) {
      map['nomor_hp'] = Variable<String>(nomorHp);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      firebaseUid: Value(firebaseUid),
      nama: Value(nama),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      peran: Value(peran),
      perusahaanId: perusahaanId == null && nullToAbsent
          ? const Value.absent()
          : Value(perusahaanId),
      nomorHp: nomorHp == null && nullToAbsent
          ? const Value.absent()
          : Value(nomorHp),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      firebaseUid: serializer.fromJson<String>(json['firebaseUid']),
      nama: serializer.fromJson<String>(json['nama']),
      username: serializer.fromJson<String?>(json['username']),
      peran: serializer.fromJson<String>(json['peran']),
      perusahaanId: serializer.fromJson<int?>(json['perusahaanId']),
      nomorHp: serializer.fromJson<String?>(json['nomorHp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firebaseUid': serializer.toJson<String>(firebaseUid),
      'nama': serializer.toJson<String>(nama),
      'username': serializer.toJson<String?>(username),
      'peran': serializer.toJson<String>(peran),
      'perusahaanId': serializer.toJson<int?>(perusahaanId),
      'nomorHp': serializer.toJson<String?>(nomorHp),
    };
  }

  User copyWith({
    String? firebaseUid,
    String? nama,
    Value<String?> username = const Value.absent(),
    String? peran,
    Value<int?> perusahaanId = const Value.absent(),
    Value<String?> nomorHp = const Value.absent(),
  }) => User(
    firebaseUid: firebaseUid ?? this.firebaseUid,
    nama: nama ?? this.nama,
    username: username.present ? username.value : this.username,
    peran: peran ?? this.peran,
    perusahaanId: perusahaanId.present ? perusahaanId.value : this.perusahaanId,
    nomorHp: nomorHp.present ? nomorHp.value : this.nomorHp,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      nama: data.nama.present ? data.nama.value : this.nama,
      username: data.username.present ? data.username.value : this.username,
      peran: data.peran.present ? data.peran.value : this.peran,
      perusahaanId: data.perusahaanId.present
          ? data.perusahaanId.value
          : this.perusahaanId,
      nomorHp: data.nomorHp.present ? data.nomorHp.value : this.nomorHp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('nama: $nama, ')
          ..write('username: $username, ')
          ..write('peran: $peran, ')
          ..write('perusahaanId: $perusahaanId, ')
          ..write('nomorHp: $nomorHp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(firebaseUid, nama, username, peran, perusahaanId, nomorHp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.firebaseUid == this.firebaseUid &&
          other.nama == this.nama &&
          other.username == this.username &&
          other.peran == this.peran &&
          other.perusahaanId == this.perusahaanId &&
          other.nomorHp == this.nomorHp);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> firebaseUid;
  final Value<String> nama;
  final Value<String?> username;
  final Value<String> peran;
  final Value<int?> perusahaanId;
  final Value<String?> nomorHp;
  final Value<int> rowid;
  const UsersCompanion({
    this.firebaseUid = const Value.absent(),
    this.nama = const Value.absent(),
    this.username = const Value.absent(),
    this.peran = const Value.absent(),
    this.perusahaanId = const Value.absent(),
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String firebaseUid,
    required String nama,
    this.username = const Value.absent(),
    required String peran,
    this.perusahaanId = const Value.absent(),
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : firebaseUid = Value(firebaseUid),
       nama = Value(nama),
       peran = Value(peran);
  static Insertable<User> custom({
    Expression<String>? firebaseUid,
    Expression<String>? nama,
    Expression<String>? username,
    Expression<String>? peran,
    Expression<int>? perusahaanId,
    Expression<String>? nomorHp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (nama != null) 'nama': nama,
      if (username != null) 'username': username,
      if (peran != null) 'peran': peran,
      if (perusahaanId != null) 'perusahaan_id': perusahaanId,
      if (nomorHp != null) 'nomor_hp': nomorHp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? firebaseUid,
    Value<String>? nama,
    Value<String?>? username,
    Value<String>? peran,
    Value<int?>? perusahaanId,
    Value<String?>? nomorHp,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      firebaseUid: firebaseUid ?? this.firebaseUid,
      nama: nama ?? this.nama,
      username: username ?? this.username,
      peran: peran ?? this.peran,
      perusahaanId: perusahaanId ?? this.perusahaanId,
      nomorHp: nomorHp ?? this.nomorHp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (peran.present) {
      map['peran'] = Variable<String>(peran.value);
    }
    if (perusahaanId.present) {
      map['perusahaan_id'] = Variable<int>(perusahaanId.value);
    }
    if (nomorHp.present) {
      map['nomor_hp'] = Variable<String>(nomorHp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('nama: $nama, ')
          ..write('username: $username, ')
          ..write('peran: $peran, ')
          ..write('perusahaanId: $perusahaanId, ')
          ..write('nomorHp: $nomorHp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaProyekMeta = const VerificationMeta(
    'namaProyek',
  );
  @override
  late final GeneratedColumn<String> namaProyek = GeneratedColumn<String>(
    'nama_proyek',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lokasiMeta = const VerificationMeta('lokasi');
  @override
  late final GeneratedColumn<String> lokasi = GeneratedColumn<String>(
    'lokasi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tanggalMulaiMeta = const VerificationMeta(
    'tanggalMulai',
  );
  @override
  late final GeneratedColumn<String> tanggalMulai = GeneratedColumn<String>(
    'tanggal_mulai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Perencanaan'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    namaProyek,
    lokasi,
    tanggalMulai,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_proyek')) {
      context.handle(
        _namaProyekMeta,
        namaProyek.isAcceptableOrUnknown(data['nama_proyek']!, _namaProyekMeta),
      );
    } else if (isInserting) {
      context.missing(_namaProyekMeta);
    }
    if (data.containsKey('lokasi')) {
      context.handle(
        _lokasiMeta,
        lokasi.isAcceptableOrUnknown(data['lokasi']!, _lokasiMeta),
      );
    }
    if (data.containsKey('tanggal_mulai')) {
      context.handle(
        _tanggalMulaiMeta,
        tanggalMulai.isAcceptableOrUnknown(
          data['tanggal_mulai']!,
          _tanggalMulaiMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      namaProyek: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_proyek'],
      )!,
      lokasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lokasi'],
      ),
      tanggalMulai: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal_mulai'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String namaProyek;
  final String? lokasi;
  final String? tanggalMulai;
  final String status;
  const Project({
    required this.id,
    required this.namaProyek,
    this.lokasi,
    this.tanggalMulai,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_proyek'] = Variable<String>(namaProyek);
    if (!nullToAbsent || lokasi != null) {
      map['lokasi'] = Variable<String>(lokasi);
    }
    if (!nullToAbsent || tanggalMulai != null) {
      map['tanggal_mulai'] = Variable<String>(tanggalMulai);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      namaProyek: Value(namaProyek),
      lokasi: lokasi == null && nullToAbsent
          ? const Value.absent()
          : Value(lokasi),
      tanggalMulai: tanggalMulai == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalMulai),
      status: Value(status),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      namaProyek: serializer.fromJson<String>(json['namaProyek']),
      lokasi: serializer.fromJson<String?>(json['lokasi']),
      tanggalMulai: serializer.fromJson<String?>(json['tanggalMulai']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaProyek': serializer.toJson<String>(namaProyek),
      'lokasi': serializer.toJson<String?>(lokasi),
      'tanggalMulai': serializer.toJson<String?>(tanggalMulai),
      'status': serializer.toJson<String>(status),
    };
  }

  Project copyWith({
    int? id,
    String? namaProyek,
    Value<String?> lokasi = const Value.absent(),
    Value<String?> tanggalMulai = const Value.absent(),
    String? status,
  }) => Project(
    id: id ?? this.id,
    namaProyek: namaProyek ?? this.namaProyek,
    lokasi: lokasi.present ? lokasi.value : this.lokasi,
    tanggalMulai: tanggalMulai.present ? tanggalMulai.value : this.tanggalMulai,
    status: status ?? this.status,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      namaProyek: data.namaProyek.present
          ? data.namaProyek.value
          : this.namaProyek,
      lokasi: data.lokasi.present ? data.lokasi.value : this.lokasi,
      tanggalMulai: data.tanggalMulai.present
          ? data.tanggalMulai.value
          : this.tanggalMulai,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('namaProyek: $namaProyek, ')
          ..write('lokasi: $lokasi, ')
          ..write('tanggalMulai: $tanggalMulai, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaProyek, lokasi, tanggalMulai, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.namaProyek == this.namaProyek &&
          other.lokasi == this.lokasi &&
          other.tanggalMulai == this.tanggalMulai &&
          other.status == this.status);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> namaProyek;
  final Value<String?> lokasi;
  final Value<String?> tanggalMulai;
  final Value<String> status;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.namaProyek = const Value.absent(),
    this.lokasi = const Value.absent(),
    this.tanggalMulai = const Value.absent(),
    this.status = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String namaProyek,
    this.lokasi = const Value.absent(),
    this.tanggalMulai = const Value.absent(),
    this.status = const Value.absent(),
  }) : namaProyek = Value(namaProyek);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? namaProyek,
    Expression<String>? lokasi,
    Expression<String>? tanggalMulai,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaProyek != null) 'nama_proyek': namaProyek,
      if (lokasi != null) 'lokasi': lokasi,
      if (tanggalMulai != null) 'tanggal_mulai': tanggalMulai,
      if (status != null) 'status': status,
    });
  }

  ProjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? namaProyek,
    Value<String?>? lokasi,
    Value<String?>? tanggalMulai,
    Value<String>? status,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      namaProyek: namaProyek ?? this.namaProyek,
      lokasi: lokasi ?? this.lokasi,
      tanggalMulai: tanggalMulai ?? this.tanggalMulai,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaProyek.present) {
      map['nama_proyek'] = Variable<String>(namaProyek.value);
    }
    if (lokasi.present) {
      map['lokasi'] = Variable<String>(lokasi.value);
    }
    if (tanggalMulai.present) {
      map['tanggal_mulai'] = Variable<String>(tanggalMulai.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('namaProyek: $namaProyek, ')
          ..write('lokasi: $lokasi, ')
          ..write('tanggalMulai: $tanggalMulai, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ReportsTable extends Reports with TableInfo<$ReportsTable, Report> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _proyekIdMeta = const VerificationMeta(
    'proyekId',
  );
  @override
  late final GeneratedColumn<int> proyekId = GeneratedColumn<int>(
    'proyek_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _pengawasIdMeta = const VerificationMeta(
    'pengawasId',
  );
  @override
  late final GeneratedColumn<String> pengawasId = GeneratedColumn<String>(
    'pengawas_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tanggalMeta = const VerificationMeta(
    'tanggal',
  );
  @override
  late final GeneratedColumn<String> tanggal = GeneratedColumn<String>(
    'tanggal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoUrlMeta = const VerificationMeta(
    'fotoUrl',
  );
  @override
  late final GeneratedColumn<String> fotoUrl = GeneratedColumn<String>(
    'foto_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proyekId,
    pengawasId,
    tanggal,
    deskripsi,
    fotoUrl,
    progress,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<Report> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proyek_id')) {
      context.handle(
        _proyekIdMeta,
        proyekId.isAcceptableOrUnknown(data['proyek_id']!, _proyekIdMeta),
      );
    } else if (isInserting) {
      context.missing(_proyekIdMeta);
    }
    if (data.containsKey('pengawas_id')) {
      context.handle(
        _pengawasIdMeta,
        pengawasId.isAcceptableOrUnknown(data['pengawas_id']!, _pengawasIdMeta),
      );
    }
    if (data.containsKey('tanggal')) {
      context.handle(
        _tanggalMeta,
        tanggal.isAcceptableOrUnknown(data['tanggal']!, _tanggalMeta),
      );
    } else if (isInserting) {
      context.missing(_tanggalMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    }
    if (data.containsKey('foto_url')) {
      context.handle(
        _fotoUrlMeta,
        fotoUrl.isAcceptableOrUnknown(data['foto_url']!, _fotoUrlMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Report map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Report(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proyekId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proyek_id'],
      )!,
      pengawasId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pengawas_id'],
      ),
      tanggal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      ),
      fotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_url'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ReportsTable createAlias(String alias) {
    return $ReportsTable(attachedDatabase, alias);
  }
}

class Report extends DataClass implements Insertable<Report> {
  final int id;
  final int proyekId;
  final String? pengawasId;
  final String tanggal;
  final String? deskripsi;
  final String? fotoUrl;
  final int progress;
  final String status;
  const Report({
    required this.id,
    required this.proyekId,
    this.pengawasId,
    required this.tanggal,
    this.deskripsi,
    this.fotoUrl,
    required this.progress,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    if (!nullToAbsent || pengawasId != null) {
      map['pengawas_id'] = Variable<String>(pengawasId);
    }
    map['tanggal'] = Variable<String>(tanggal);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    if (!nullToAbsent || fotoUrl != null) {
      map['foto_url'] = Variable<String>(fotoUrl);
    }
    map['progress'] = Variable<int>(progress);
    map['status'] = Variable<String>(status);
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      pengawasId: pengawasId == null && nullToAbsent
          ? const Value.absent()
          : Value(pengawasId),
      tanggal: Value(tanggal),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      fotoUrl: fotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoUrl),
      progress: Value(progress),
      status: Value(status),
    );
  }

  factory Report.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Report(
      id: serializer.fromJson<int>(json['id']),
      proyekId: serializer.fromJson<int>(json['proyekId']),
      pengawasId: serializer.fromJson<String?>(json['pengawasId']),
      tanggal: serializer.fromJson<String>(json['tanggal']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      fotoUrl: serializer.fromJson<String?>(json['fotoUrl']),
      progress: serializer.fromJson<int>(json['progress']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'pengawasId': serializer.toJson<String?>(pengawasId),
      'tanggal': serializer.toJson<String>(tanggal),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'fotoUrl': serializer.toJson<String?>(fotoUrl),
      'progress': serializer.toJson<int>(progress),
      'status': serializer.toJson<String>(status),
    };
  }

  Report copyWith({
    int? id,
    int? proyekId,
    Value<String?> pengawasId = const Value.absent(),
    String? tanggal,
    Value<String?> deskripsi = const Value.absent(),
    Value<String?> fotoUrl = const Value.absent(),
    int? progress,
    String? status,
  }) => Report(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    pengawasId: pengawasId.present ? pengawasId.value : this.pengawasId,
    tanggal: tanggal ?? this.tanggal,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    fotoUrl: fotoUrl.present ? fotoUrl.value : this.fotoUrl,
    progress: progress ?? this.progress,
    status: status ?? this.status,
  );
  Report copyWithCompanion(ReportsCompanion data) {
    return Report(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      pengawasId: data.pengawasId.present
          ? data.pengawasId.value
          : this.pengawasId,
      tanggal: data.tanggal.present ? data.tanggal.value : this.tanggal,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      fotoUrl: data.fotoUrl.present ? data.fotoUrl.value : this.fotoUrl,
      progress: data.progress.present ? data.progress.value : this.progress,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Report(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('pengawasId: $pengawasId, ')
          ..write('tanggal: $tanggal, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoUrl: $fotoUrl, ')
          ..write('progress: $progress, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    proyekId,
    pengawasId,
    tanggal,
    deskripsi,
    fotoUrl,
    progress,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Report &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.pengawasId == this.pengawasId &&
          other.tanggal == this.tanggal &&
          other.deskripsi == this.deskripsi &&
          other.fotoUrl == this.fotoUrl &&
          other.progress == this.progress &&
          other.status == this.status);
}

class ReportsCompanion extends UpdateCompanion<Report> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<String?> pengawasId;
  final Value<String> tanggal;
  final Value<String?> deskripsi;
  final Value<String?> fotoUrl;
  final Value<int> progress;
  final Value<String> status;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.pengawasId = const Value.absent(),
    this.tanggal = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.fotoUrl = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
  });
  ReportsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    this.pengawasId = const Value.absent(),
    required String tanggal,
    this.deskripsi = const Value.absent(),
    this.fotoUrl = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
  }) : proyekId = Value(proyekId),
       tanggal = Value(tanggal);
  static Insertable<Report> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<String>? pengawasId,
    Expression<String>? tanggal,
    Expression<String>? deskripsi,
    Expression<String>? fotoUrl,
    Expression<int>? progress,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (pengawasId != null) 'pengawas_id': pengawasId,
      if (tanggal != null) 'tanggal': tanggal,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (fotoUrl != null) 'foto_url': fotoUrl,
      if (progress != null) 'progress': progress,
      if (status != null) 'status': status,
    });
  }

  ReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<String?>? pengawasId,
    Value<String>? tanggal,
    Value<String?>? deskripsi,
    Value<String?>? fotoUrl,
    Value<int>? progress,
    Value<String>? status,
  }) {
    return ReportsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      pengawasId: pengawasId ?? this.pengawasId,
      tanggal: tanggal ?? this.tanggal,
      deskripsi: deskripsi ?? this.deskripsi,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      progress: progress ?? this.progress,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proyekId.present) {
      map['proyek_id'] = Variable<int>(proyekId.value);
    }
    if (pengawasId.present) {
      map['pengawas_id'] = Variable<String>(pengawasId.value);
    }
    if (tanggal.present) {
      map['tanggal'] = Variable<String>(tanggal.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (fotoUrl.present) {
      map['foto_url'] = Variable<String>(fotoUrl.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('pengawasId: $pengawasId, ')
          ..write('tanggal: $tanggal, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoUrl: $fotoUrl, ')
          ..write('progress: $progress, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reportIdMeta = const VerificationMeta(
    'reportId',
  );
  @override
  late final GeneratedColumn<int> reportId = GeneratedColumn<int>(
    'report_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reports (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _namaPekerjaanMeta = const VerificationMeta(
    'namaPekerjaan',
  );
  @override
  late final GeneratedColumn<String> namaPekerjaan = GeneratedColumn<String>(
    'nama_pekerjaan',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSelesaiMeta = const VerificationMeta(
    'isSelesai',
  );
  @override
  late final GeneratedColumn<bool> isSelesai = GeneratedColumn<bool>(
    'is_selesai',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selesai" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reportId,
    namaPekerjaan,
    isSelesai,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reportIdMeta);
    }
    if (data.containsKey('nama_pekerjaan')) {
      context.handle(
        _namaPekerjaanMeta,
        namaPekerjaan.isAcceptableOrUnknown(
          data['nama_pekerjaan']!,
          _namaPekerjaanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaPekerjaanMeta);
    }
    if (data.containsKey('is_selesai')) {
      context.handle(
        _isSelesaiMeta,
        isSelesai.isAcceptableOrUnknown(data['is_selesai']!, _isSelesaiMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}report_id'],
      )!,
      namaPekerjaan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_pekerjaan'],
      )!,
      isSelesai: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selesai'],
      )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final int reportId;
  final String namaPekerjaan;
  final bool isSelesai;
  const Task({
    required this.id,
    required this.reportId,
    required this.namaPekerjaan,
    required this.isSelesai,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['report_id'] = Variable<int>(reportId);
    map['nama_pekerjaan'] = Variable<String>(namaPekerjaan);
    map['is_selesai'] = Variable<bool>(isSelesai);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      reportId: Value(reportId),
      namaPekerjaan: Value(namaPekerjaan),
      isSelesai: Value(isSelesai),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      reportId: serializer.fromJson<int>(json['reportId']),
      namaPekerjaan: serializer.fromJson<String>(json['namaPekerjaan']),
      isSelesai: serializer.fromJson<bool>(json['isSelesai']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reportId': serializer.toJson<int>(reportId),
      'namaPekerjaan': serializer.toJson<String>(namaPekerjaan),
      'isSelesai': serializer.toJson<bool>(isSelesai),
    };
  }

  Task copyWith({
    int? id,
    int? reportId,
    String? namaPekerjaan,
    bool? isSelesai,
  }) => Task(
    id: id ?? this.id,
    reportId: reportId ?? this.reportId,
    namaPekerjaan: namaPekerjaan ?? this.namaPekerjaan,
    isSelesai: isSelesai ?? this.isSelesai,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      namaPekerjaan: data.namaPekerjaan.present
          ? data.namaPekerjaan.value
          : this.namaPekerjaan,
      isSelesai: data.isSelesai.present ? data.isSelesai.value : this.isSelesai,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('namaPekerjaan: $namaPekerjaan, ')
          ..write('isSelesai: $isSelesai')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportId, namaPekerjaan, isSelesai);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.namaPekerjaan == this.namaPekerjaan &&
          other.isSelesai == this.isSelesai);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<int> reportId;
  final Value<String> namaPekerjaan;
  final Value<bool> isSelesai;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.namaPekerjaan = const Value.absent(),
    this.isSelesai = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required int reportId,
    required String namaPekerjaan,
    this.isSelesai = const Value.absent(),
  }) : reportId = Value(reportId),
       namaPekerjaan = Value(namaPekerjaan);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<int>? reportId,
    Expression<String>? namaPekerjaan,
    Expression<bool>? isSelesai,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (namaPekerjaan != null) 'nama_pekerjaan': namaPekerjaan,
      if (isSelesai != null) 'is_selesai': isSelesai,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<int>? reportId,
    Value<String>? namaPekerjaan,
    Value<bool>? isSelesai,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      namaPekerjaan: namaPekerjaan ?? this.namaPekerjaan,
      isSelesai: isSelesai ?? this.isSelesai,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<int>(reportId.value);
    }
    if (namaPekerjaan.present) {
      map['nama_pekerjaan'] = Variable<String>(namaPekerjaan.value);
    }
    if (isSelesai.present) {
      map['is_selesai'] = Variable<bool>(isSelesai.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('namaPekerjaan: $namaPekerjaan, ')
          ..write('isSelesai: $isSelesai')
          ..write(')'))
        .toString();
  }
}

class $ReportMaterialsTable extends ReportMaterials
    with TableInfo<$ReportMaterialsTable, ReportMaterial> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportMaterialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reportIdMeta = const VerificationMeta(
    'reportId',
  );
  @override
  late final GeneratedColumn<int> reportId = GeneratedColumn<int>(
    'report_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reports (id)',
    ),
  );
  static const VerificationMeta _namaMaterialMeta = const VerificationMeta(
    'namaMaterial',
  );
  @override
  late final GeneratedColumn<String> namaMaterial = GeneratedColumn<String>(
    'nama_material',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _satuanMeta = const VerificationMeta('satuan');
  @override
  late final GeneratedColumn<String> satuan = GeneratedColumn<String>(
    'satuan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
    'volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reportId,
    namaMaterial,
    satuan,
    volume,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_materials';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReportMaterial> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reportIdMeta);
    }
    if (data.containsKey('nama_material')) {
      context.handle(
        _namaMaterialMeta,
        namaMaterial.isAcceptableOrUnknown(
          data['nama_material']!,
          _namaMaterialMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaMaterialMeta);
    }
    if (data.containsKey('satuan')) {
      context.handle(
        _satuanMeta,
        satuan.isAcceptableOrUnknown(data['satuan']!, _satuanMeta),
      );
    } else if (isInserting) {
      context.missing(_satuanMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportMaterial map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportMaterial(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}report_id'],
      )!,
      namaMaterial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_material'],
      )!,
      satuan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}satuan'],
      )!,
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume'],
      )!,
    );
  }

  @override
  $ReportMaterialsTable createAlias(String alias) {
    return $ReportMaterialsTable(attachedDatabase, alias);
  }
}

class ReportMaterial extends DataClass implements Insertable<ReportMaterial> {
  final int id;
  final int reportId;
  final String namaMaterial;
  final String satuan;
  final double volume;
  const ReportMaterial({
    required this.id,
    required this.reportId,
    required this.namaMaterial,
    required this.satuan,
    required this.volume,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['report_id'] = Variable<int>(reportId);
    map['nama_material'] = Variable<String>(namaMaterial);
    map['satuan'] = Variable<String>(satuan);
    map['volume'] = Variable<double>(volume);
    return map;
  }

  ReportMaterialsCompanion toCompanion(bool nullToAbsent) {
    return ReportMaterialsCompanion(
      id: Value(id),
      reportId: Value(reportId),
      namaMaterial: Value(namaMaterial),
      satuan: Value(satuan),
      volume: Value(volume),
    );
  }

  factory ReportMaterial.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportMaterial(
      id: serializer.fromJson<int>(json['id']),
      reportId: serializer.fromJson<int>(json['reportId']),
      namaMaterial: serializer.fromJson<String>(json['namaMaterial']),
      satuan: serializer.fromJson<String>(json['satuan']),
      volume: serializer.fromJson<double>(json['volume']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reportId': serializer.toJson<int>(reportId),
      'namaMaterial': serializer.toJson<String>(namaMaterial),
      'satuan': serializer.toJson<String>(satuan),
      'volume': serializer.toJson<double>(volume),
    };
  }

  ReportMaterial copyWith({
    int? id,
    int? reportId,
    String? namaMaterial,
    String? satuan,
    double? volume,
  }) => ReportMaterial(
    id: id ?? this.id,
    reportId: reportId ?? this.reportId,
    namaMaterial: namaMaterial ?? this.namaMaterial,
    satuan: satuan ?? this.satuan,
    volume: volume ?? this.volume,
  );
  ReportMaterial copyWithCompanion(ReportMaterialsCompanion data) {
    return ReportMaterial(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      namaMaterial: data.namaMaterial.present
          ? data.namaMaterial.value
          : this.namaMaterial,
      satuan: data.satuan.present ? data.satuan.value : this.satuan,
      volume: data.volume.present ? data.volume.value : this.volume,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportMaterial(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('namaMaterial: $namaMaterial, ')
          ..write('satuan: $satuan, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportId, namaMaterial, satuan, volume);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportMaterial &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.namaMaterial == this.namaMaterial &&
          other.satuan == this.satuan &&
          other.volume == this.volume);
}

class ReportMaterialsCompanion extends UpdateCompanion<ReportMaterial> {
  final Value<int> id;
  final Value<int> reportId;
  final Value<String> namaMaterial;
  final Value<String> satuan;
  final Value<double> volume;
  const ReportMaterialsCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.namaMaterial = const Value.absent(),
    this.satuan = const Value.absent(),
    this.volume = const Value.absent(),
  });
  ReportMaterialsCompanion.insert({
    this.id = const Value.absent(),
    required int reportId,
    required String namaMaterial,
    required String satuan,
    required double volume,
  }) : reportId = Value(reportId),
       namaMaterial = Value(namaMaterial),
       satuan = Value(satuan),
       volume = Value(volume);
  static Insertable<ReportMaterial> custom({
    Expression<int>? id,
    Expression<int>? reportId,
    Expression<String>? namaMaterial,
    Expression<String>? satuan,
    Expression<double>? volume,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (namaMaterial != null) 'nama_material': namaMaterial,
      if (satuan != null) 'satuan': satuan,
      if (volume != null) 'volume': volume,
    });
  }

  ReportMaterialsCompanion copyWith({
    Value<int>? id,
    Value<int>? reportId,
    Value<String>? namaMaterial,
    Value<String>? satuan,
    Value<double>? volume,
  }) {
    return ReportMaterialsCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      namaMaterial: namaMaterial ?? this.namaMaterial,
      satuan: satuan ?? this.satuan,
      volume: volume ?? this.volume,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<int>(reportId.value);
    }
    if (namaMaterial.present) {
      map['nama_material'] = Variable<String>(namaMaterial.value);
    }
    if (satuan.present) {
      map['satuan'] = Variable<String>(satuan.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportMaterialsCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('namaMaterial: $namaMaterial, ')
          ..write('satuan: $satuan, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }
}

class $ReportPhotosTable extends ReportPhotos
    with TableInfo<$ReportPhotosTable, ReportPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReportPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reportIdMeta = const VerificationMeta(
    'reportId',
  );
  @override
  late final GeneratedColumn<int> reportId = GeneratedColumn<int>(
    'report_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reports (id)',
    ),
  );
  static const VerificationMeta _fotoUrlMeta = const VerificationMeta(
    'fotoUrl',
  );
  @override
  late final GeneratedColumn<String> fotoUrl = GeneratedColumn<String>(
    'foto_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, reportId, fotoUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'report_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReportPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reportIdMeta);
    }
    if (data.containsKey('foto_url')) {
      context.handle(
        _fotoUrlMeta,
        fotoUrl.isAcceptableOrUnknown(data['foto_url']!, _fotoUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fotoUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReportPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReportPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}report_id'],
      )!,
      fotoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_url'],
      )!,
    );
  }

  @override
  $ReportPhotosTable createAlias(String alias) {
    return $ReportPhotosTable(attachedDatabase, alias);
  }
}

class ReportPhoto extends DataClass implements Insertable<ReportPhoto> {
  final int id;
  final int reportId;
  final String fotoUrl;
  const ReportPhoto({
    required this.id,
    required this.reportId,
    required this.fotoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['report_id'] = Variable<int>(reportId);
    map['foto_url'] = Variable<String>(fotoUrl);
    return map;
  }

  ReportPhotosCompanion toCompanion(bool nullToAbsent) {
    return ReportPhotosCompanion(
      id: Value(id),
      reportId: Value(reportId),
      fotoUrl: Value(fotoUrl),
    );
  }

  factory ReportPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReportPhoto(
      id: serializer.fromJson<int>(json['id']),
      reportId: serializer.fromJson<int>(json['reportId']),
      fotoUrl: serializer.fromJson<String>(json['fotoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reportId': serializer.toJson<int>(reportId),
      'fotoUrl': serializer.toJson<String>(fotoUrl),
    };
  }

  ReportPhoto copyWith({int? id, int? reportId, String? fotoUrl}) =>
      ReportPhoto(
        id: id ?? this.id,
        reportId: reportId ?? this.reportId,
        fotoUrl: fotoUrl ?? this.fotoUrl,
      );
  ReportPhoto copyWithCompanion(ReportPhotosCompanion data) {
    return ReportPhoto(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      fotoUrl: data.fotoUrl.present ? data.fotoUrl.value : this.fotoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReportPhoto(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('fotoUrl: $fotoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportId, fotoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReportPhoto &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.fotoUrl == this.fotoUrl);
}

class ReportPhotosCompanion extends UpdateCompanion<ReportPhoto> {
  final Value<int> id;
  final Value<int> reportId;
  final Value<String> fotoUrl;
  const ReportPhotosCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.fotoUrl = const Value.absent(),
  });
  ReportPhotosCompanion.insert({
    this.id = const Value.absent(),
    required int reportId,
    required String fotoUrl,
  }) : reportId = Value(reportId),
       fotoUrl = Value(fotoUrl);
  static Insertable<ReportPhoto> custom({
    Expression<int>? id,
    Expression<int>? reportId,
    Expression<String>? fotoUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (fotoUrl != null) 'foto_url': fotoUrl,
    });
  }

  ReportPhotosCompanion copyWith({
    Value<int>? id,
    Value<int>? reportId,
    Value<String>? fotoUrl,
  }) {
    return ReportPhotosCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      fotoUrl: fotoUrl ?? this.fotoUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<int>(reportId.value);
    }
    if (fotoUrl.present) {
      map['foto_url'] = Variable<String>(fotoUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportPhotosCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('fotoUrl: $fotoUrl')
          ..write(')'))
        .toString();
  }
}

class $ProjectTeamsTable extends ProjectTeams
    with TableInfo<$ProjectTeamsTable, ProjectTeam> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTeamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _proyekIdMeta = const VerificationMeta(
    'proyekId',
  );
  @override
  late final GeneratedColumn<int> proyekId = GeneratedColumn<int>(
    'proyek_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid)',
    ),
  );
  static const VerificationMeta _peranDiProyekMeta = const VerificationMeta(
    'peranDiProyek',
  );
  @override
  late final GeneratedColumn<String> peranDiProyek = GeneratedColumn<String>(
    'peran_di_proyek',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, proyekId, userId, peranDiProyek];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_teams';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectTeam> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proyek_id')) {
      context.handle(
        _proyekIdMeta,
        proyekId.isAcceptableOrUnknown(data['proyek_id']!, _proyekIdMeta),
      );
    } else if (isInserting) {
      context.missing(_proyekIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('peran_di_proyek')) {
      context.handle(
        _peranDiProyekMeta,
        peranDiProyek.isAcceptableOrUnknown(
          data['peran_di_proyek']!,
          _peranDiProyekMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_peranDiProyekMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectTeam map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTeam(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proyekId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proyek_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      peranDiProyek: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peran_di_proyek'],
      )!,
    );
  }

  @override
  $ProjectTeamsTable createAlias(String alias) {
    return $ProjectTeamsTable(attachedDatabase, alias);
  }
}

class ProjectTeam extends DataClass implements Insertable<ProjectTeam> {
  final int id;
  final int proyekId;
  final String userId;
  final String peranDiProyek;
  const ProjectTeam({
    required this.id,
    required this.proyekId,
    required this.userId,
    required this.peranDiProyek,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    map['user_id'] = Variable<String>(userId);
    map['peran_di_proyek'] = Variable<String>(peranDiProyek);
    return map;
  }

  ProjectTeamsCompanion toCompanion(bool nullToAbsent) {
    return ProjectTeamsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      userId: Value(userId),
      peranDiProyek: Value(peranDiProyek),
    );
  }

  factory ProjectTeam.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTeam(
      id: serializer.fromJson<int>(json['id']),
      proyekId: serializer.fromJson<int>(json['proyekId']),
      userId: serializer.fromJson<String>(json['userId']),
      peranDiProyek: serializer.fromJson<String>(json['peranDiProyek']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'userId': serializer.toJson<String>(userId),
      'peranDiProyek': serializer.toJson<String>(peranDiProyek),
    };
  }

  ProjectTeam copyWith({
    int? id,
    int? proyekId,
    String? userId,
    String? peranDiProyek,
  }) => ProjectTeam(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    userId: userId ?? this.userId,
    peranDiProyek: peranDiProyek ?? this.peranDiProyek,
  );
  ProjectTeam copyWithCompanion(ProjectTeamsCompanion data) {
    return ProjectTeam(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      userId: data.userId.present ? data.userId.value : this.userId,
      peranDiProyek: data.peranDiProyek.present
          ? data.peranDiProyek.value
          : this.peranDiProyek,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTeam(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('userId: $userId, ')
          ..write('peranDiProyek: $peranDiProyek')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, proyekId, userId, peranDiProyek);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTeam &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.userId == this.userId &&
          other.peranDiProyek == this.peranDiProyek);
}

class ProjectTeamsCompanion extends UpdateCompanion<ProjectTeam> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<String> userId;
  final Value<String> peranDiProyek;
  const ProjectTeamsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.userId = const Value.absent(),
    this.peranDiProyek = const Value.absent(),
  });
  ProjectTeamsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    required String userId,
    required String peranDiProyek,
  }) : proyekId = Value(proyekId),
       userId = Value(userId),
       peranDiProyek = Value(peranDiProyek);
  static Insertable<ProjectTeam> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<String>? userId,
    Expression<String>? peranDiProyek,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (userId != null) 'user_id': userId,
      if (peranDiProyek != null) 'peran_di_proyek': peranDiProyek,
    });
  }

  ProjectTeamsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<String>? userId,
    Value<String>? peranDiProyek,
  }) {
    return ProjectTeamsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      userId: userId ?? this.userId,
      peranDiProyek: peranDiProyek ?? this.peranDiProyek,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proyekId.present) {
      map['proyek_id'] = Variable<int>(proyekId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (peranDiProyek.present) {
      map['peran_di_proyek'] = Variable<String>(peranDiProyek.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTeamsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('userId: $userId, ')
          ..write('peranDiProyek: $peranDiProyek')
          ..write(')'))
        .toString();
  }
}

class $DocumentFoldersTable extends DocumentFolders
    with TableInfo<$DocumentFoldersTable, DocumentFolder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentFoldersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaFolderMeta = const VerificationMeta(
    'namaFolder',
  );
  @override
  late final GeneratedColumn<String> namaFolder = GeneratedColumn<String>(
    'nama_folder',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kategoriMeta = const VerificationMeta(
    'kategori',
  );
  @override
  late final GeneratedColumn<String> kategori = GeneratedColumn<String>(
    'kategori',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, namaFolder, kategori];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_folders';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentFolder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_folder')) {
      context.handle(
        _namaFolderMeta,
        namaFolder.isAcceptableOrUnknown(data['nama_folder']!, _namaFolderMeta),
      );
    } else if (isInserting) {
      context.missing(_namaFolderMeta);
    }
    if (data.containsKey('kategori')) {
      context.handle(
        _kategoriMeta,
        kategori.isAcceptableOrUnknown(data['kategori']!, _kategoriMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentFolder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentFolder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      namaFolder: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_folder'],
      )!,
      kategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kategori'],
      ),
    );
  }

  @override
  $DocumentFoldersTable createAlias(String alias) {
    return $DocumentFoldersTable(attachedDatabase, alias);
  }
}

class DocumentFolder extends DataClass implements Insertable<DocumentFolder> {
  final int id;
  final String namaFolder;
  final String? kategori;
  const DocumentFolder({
    required this.id,
    required this.namaFolder,
    this.kategori,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_folder'] = Variable<String>(namaFolder);
    if (!nullToAbsent || kategori != null) {
      map['kategori'] = Variable<String>(kategori);
    }
    return map;
  }

  DocumentFoldersCompanion toCompanion(bool nullToAbsent) {
    return DocumentFoldersCompanion(
      id: Value(id),
      namaFolder: Value(namaFolder),
      kategori: kategori == null && nullToAbsent
          ? const Value.absent()
          : Value(kategori),
    );
  }

  factory DocumentFolder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentFolder(
      id: serializer.fromJson<int>(json['id']),
      namaFolder: serializer.fromJson<String>(json['namaFolder']),
      kategori: serializer.fromJson<String?>(json['kategori']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaFolder': serializer.toJson<String>(namaFolder),
      'kategori': serializer.toJson<String?>(kategori),
    };
  }

  DocumentFolder copyWith({
    int? id,
    String? namaFolder,
    Value<String?> kategori = const Value.absent(),
  }) => DocumentFolder(
    id: id ?? this.id,
    namaFolder: namaFolder ?? this.namaFolder,
    kategori: kategori.present ? kategori.value : this.kategori,
  );
  DocumentFolder copyWithCompanion(DocumentFoldersCompanion data) {
    return DocumentFolder(
      id: data.id.present ? data.id.value : this.id,
      namaFolder: data.namaFolder.present
          ? data.namaFolder.value
          : this.namaFolder,
      kategori: data.kategori.present ? data.kategori.value : this.kategori,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentFolder(')
          ..write('id: $id, ')
          ..write('namaFolder: $namaFolder, ')
          ..write('kategori: $kategori')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaFolder, kategori);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentFolder &&
          other.id == this.id &&
          other.namaFolder == this.namaFolder &&
          other.kategori == this.kategori);
}

class DocumentFoldersCompanion extends UpdateCompanion<DocumentFolder> {
  final Value<int> id;
  final Value<String> namaFolder;
  final Value<String?> kategori;
  const DocumentFoldersCompanion({
    this.id = const Value.absent(),
    this.namaFolder = const Value.absent(),
    this.kategori = const Value.absent(),
  });
  DocumentFoldersCompanion.insert({
    this.id = const Value.absent(),
    required String namaFolder,
    this.kategori = const Value.absent(),
  }) : namaFolder = Value(namaFolder);
  static Insertable<DocumentFolder> custom({
    Expression<int>? id,
    Expression<String>? namaFolder,
    Expression<String>? kategori,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaFolder != null) 'nama_folder': namaFolder,
      if (kategori != null) 'kategori': kategori,
    });
  }

  DocumentFoldersCompanion copyWith({
    Value<int>? id,
    Value<String>? namaFolder,
    Value<String?>? kategori,
  }) {
    return DocumentFoldersCompanion(
      id: id ?? this.id,
      namaFolder: namaFolder ?? this.namaFolder,
      kategori: kategori ?? this.kategori,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaFolder.present) {
      map['nama_folder'] = Variable<String>(namaFolder.value);
    }
    if (kategori.present) {
      map['kategori'] = Variable<String>(kategori.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentFoldersCompanion(')
          ..write('id: $id, ')
          ..write('namaFolder: $namaFolder, ')
          ..write('kategori: $kategori')
          ..write(')'))
        .toString();
  }
}

class $ProjectDocumentsTable extends ProjectDocuments
    with TableInfo<$ProjectDocumentsTable, ProjectDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _proyekIdMeta = const VerificationMeta(
    'proyekId',
  );
  @override
  late final GeneratedColumn<int> proyekId = GeneratedColumn<int>(
    'proyek_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id)',
    ),
  );
  static const VerificationMeta _folderIdMeta = const VerificationMeta(
    'folderId',
  );
  @override
  late final GeneratedColumn<int> folderId = GeneratedColumn<int>(
    'folder_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES document_folders (id)',
    ),
  );
  static const VerificationMeta _namaFileMeta = const VerificationMeta(
    'namaFile',
  );
  @override
  late final GeneratedColumn<String> namaFile = GeneratedColumn<String>(
    'nama_file',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileUrlMeta = const VerificationMeta(
    'fileUrl',
  );
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
    'file_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diunggahOlehMeta = const VerificationMeta(
    'diunggahOleh',
  );
  @override
  late final GeneratedColumn<String> diunggahOleh = GeneratedColumn<String>(
    'diunggah_oleh',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid)',
    ),
  );
  static const VerificationMeta _tanggalUnggahMeta = const VerificationMeta(
    'tanggalUnggah',
  );
  @override
  late final GeneratedColumn<String> tanggalUnggah = GeneratedColumn<String>(
    'tanggal_unggah',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proyekId,
    folderId,
    namaFile,
    fileUrl,
    diunggahOleh,
    tanggalUnggah,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proyek_id')) {
      context.handle(
        _proyekIdMeta,
        proyekId.isAcceptableOrUnknown(data['proyek_id']!, _proyekIdMeta),
      );
    } else if (isInserting) {
      context.missing(_proyekIdMeta);
    }
    if (data.containsKey('folder_id')) {
      context.handle(
        _folderIdMeta,
        folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    if (data.containsKey('nama_file')) {
      context.handle(
        _namaFileMeta,
        namaFile.isAcceptableOrUnknown(data['nama_file']!, _namaFileMeta),
      );
    } else if (isInserting) {
      context.missing(_namaFileMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(
        _fileUrlMeta,
        fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('diunggah_oleh')) {
      context.handle(
        _diunggahOlehMeta,
        diunggahOleh.isAcceptableOrUnknown(
          data['diunggah_oleh']!,
          _diunggahOlehMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_diunggahOlehMeta);
    }
    if (data.containsKey('tanggal_unggah')) {
      context.handle(
        _tanggalUnggahMeta,
        tanggalUnggah.isAcceptableOrUnknown(
          data['tanggal_unggah']!,
          _tanggalUnggahMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalUnggahMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proyekId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proyek_id'],
      )!,
      folderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}folder_id'],
      )!,
      namaFile: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_file'],
      )!,
      fileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_url'],
      )!,
      diunggahOleh: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diunggah_oleh'],
      )!,
      tanggalUnggah: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal_unggah'],
      )!,
    );
  }

  @override
  $ProjectDocumentsTable createAlias(String alias) {
    return $ProjectDocumentsTable(attachedDatabase, alias);
  }
}

class ProjectDocument extends DataClass implements Insertable<ProjectDocument> {
  final int id;
  final int proyekId;
  final int folderId;
  final String namaFile;
  final String fileUrl;
  final String diunggahOleh;
  final String tanggalUnggah;
  const ProjectDocument({
    required this.id,
    required this.proyekId,
    required this.folderId,
    required this.namaFile,
    required this.fileUrl,
    required this.diunggahOleh,
    required this.tanggalUnggah,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    map['folder_id'] = Variable<int>(folderId);
    map['nama_file'] = Variable<String>(namaFile);
    map['file_url'] = Variable<String>(fileUrl);
    map['diunggah_oleh'] = Variable<String>(diunggahOleh);
    map['tanggal_unggah'] = Variable<String>(tanggalUnggah);
    return map;
  }

  ProjectDocumentsCompanion toCompanion(bool nullToAbsent) {
    return ProjectDocumentsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      folderId: Value(folderId),
      namaFile: Value(namaFile),
      fileUrl: Value(fileUrl),
      diunggahOleh: Value(diunggahOleh),
      tanggalUnggah: Value(tanggalUnggah),
    );
  }

  factory ProjectDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectDocument(
      id: serializer.fromJson<int>(json['id']),
      proyekId: serializer.fromJson<int>(json['proyekId']),
      folderId: serializer.fromJson<int>(json['folderId']),
      namaFile: serializer.fromJson<String>(json['namaFile']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      diunggahOleh: serializer.fromJson<String>(json['diunggahOleh']),
      tanggalUnggah: serializer.fromJson<String>(json['tanggalUnggah']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'folderId': serializer.toJson<int>(folderId),
      'namaFile': serializer.toJson<String>(namaFile),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'diunggahOleh': serializer.toJson<String>(diunggahOleh),
      'tanggalUnggah': serializer.toJson<String>(tanggalUnggah),
    };
  }

  ProjectDocument copyWith({
    int? id,
    int? proyekId,
    int? folderId,
    String? namaFile,
    String? fileUrl,
    String? diunggahOleh,
    String? tanggalUnggah,
  }) => ProjectDocument(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    folderId: folderId ?? this.folderId,
    namaFile: namaFile ?? this.namaFile,
    fileUrl: fileUrl ?? this.fileUrl,
    diunggahOleh: diunggahOleh ?? this.diunggahOleh,
    tanggalUnggah: tanggalUnggah ?? this.tanggalUnggah,
  );
  ProjectDocument copyWithCompanion(ProjectDocumentsCompanion data) {
    return ProjectDocument(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
      namaFile: data.namaFile.present ? data.namaFile.value : this.namaFile,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      diunggahOleh: data.diunggahOleh.present
          ? data.diunggahOleh.value
          : this.diunggahOleh,
      tanggalUnggah: data.tanggalUnggah.present
          ? data.tanggalUnggah.value
          : this.tanggalUnggah,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectDocument(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('folderId: $folderId, ')
          ..write('namaFile: $namaFile, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('diunggahOleh: $diunggahOleh, ')
          ..write('tanggalUnggah: $tanggalUnggah')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    proyekId,
    folderId,
    namaFile,
    fileUrl,
    diunggahOleh,
    tanggalUnggah,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectDocument &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.folderId == this.folderId &&
          other.namaFile == this.namaFile &&
          other.fileUrl == this.fileUrl &&
          other.diunggahOleh == this.diunggahOleh &&
          other.tanggalUnggah == this.tanggalUnggah);
}

class ProjectDocumentsCompanion extends UpdateCompanion<ProjectDocument> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<int> folderId;
  final Value<String> namaFile;
  final Value<String> fileUrl;
  final Value<String> diunggahOleh;
  final Value<String> tanggalUnggah;
  const ProjectDocumentsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.folderId = const Value.absent(),
    this.namaFile = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.diunggahOleh = const Value.absent(),
    this.tanggalUnggah = const Value.absent(),
  });
  ProjectDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    required int folderId,
    required String namaFile,
    required String fileUrl,
    required String diunggahOleh,
    required String tanggalUnggah,
  }) : proyekId = Value(proyekId),
       folderId = Value(folderId),
       namaFile = Value(namaFile),
       fileUrl = Value(fileUrl),
       diunggahOleh = Value(diunggahOleh),
       tanggalUnggah = Value(tanggalUnggah);
  static Insertable<ProjectDocument> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<int>? folderId,
    Expression<String>? namaFile,
    Expression<String>? fileUrl,
    Expression<String>? diunggahOleh,
    Expression<String>? tanggalUnggah,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (folderId != null) 'folder_id': folderId,
      if (namaFile != null) 'nama_file': namaFile,
      if (fileUrl != null) 'file_url': fileUrl,
      if (diunggahOleh != null) 'diunggah_oleh': diunggahOleh,
      if (tanggalUnggah != null) 'tanggal_unggah': tanggalUnggah,
    });
  }

  ProjectDocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<int>? folderId,
    Value<String>? namaFile,
    Value<String>? fileUrl,
    Value<String>? diunggahOleh,
    Value<String>? tanggalUnggah,
  }) {
    return ProjectDocumentsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      folderId: folderId ?? this.folderId,
      namaFile: namaFile ?? this.namaFile,
      fileUrl: fileUrl ?? this.fileUrl,
      diunggahOleh: diunggahOleh ?? this.diunggahOleh,
      tanggalUnggah: tanggalUnggah ?? this.tanggalUnggah,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proyekId.present) {
      map['proyek_id'] = Variable<int>(proyekId.value);
    }
    if (folderId.present) {
      map['folder_id'] = Variable<int>(folderId.value);
    }
    if (namaFile.present) {
      map['nama_file'] = Variable<String>(namaFile.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (diunggahOleh.present) {
      map['diunggah_oleh'] = Variable<String>(diunggahOleh.value);
    }
    if (tanggalUnggah.present) {
      map['tanggal_unggah'] = Variable<String>(tanggalUnggah.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('folderId: $folderId, ')
          ..write('namaFile: $namaFile, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('diunggahOleh: $diunggahOleh, ')
          ..write('tanggalUnggah: $tanggalUnggah')
          ..write(')'))
        .toString();
  }
}

class $ProjectLogsTable extends ProjectLogs
    with TableInfo<$ProjectLogsTable, ProjectLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _proyekIdMeta = const VerificationMeta(
    'proyekId',
  );
  @override
  late final GeneratedColumn<int> proyekId = GeneratedColumn<int>(
    'proyek_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid)',
    ),
  );
  static const VerificationMeta _aktivitasMeta = const VerificationMeta(
    'aktivitas',
  );
  @override
  late final GeneratedColumn<String> aktivitas = GeneratedColumn<String>(
    'aktivitas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waktuMeta = const VerificationMeta('waktu');
  @override
  late final GeneratedColumn<String> waktu = GeneratedColumn<String>(
    'waktu',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proyekId,
    userId,
    aktivitas,
    waktu,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proyek_id')) {
      context.handle(
        _proyekIdMeta,
        proyekId.isAcceptableOrUnknown(data['proyek_id']!, _proyekIdMeta),
      );
    } else if (isInserting) {
      context.missing(_proyekIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('aktivitas')) {
      context.handle(
        _aktivitasMeta,
        aktivitas.isAcceptableOrUnknown(data['aktivitas']!, _aktivitasMeta),
      );
    } else if (isInserting) {
      context.missing(_aktivitasMeta);
    }
    if (data.containsKey('waktu')) {
      context.handle(
        _waktuMeta,
        waktu.isAcceptableOrUnknown(data['waktu']!, _waktuMeta),
      );
    } else if (isInserting) {
      context.missing(_waktuMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proyekId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proyek_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      aktivitas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aktivitas'],
      )!,
      waktu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}waktu'],
      )!,
    );
  }

  @override
  $ProjectLogsTable createAlias(String alias) {
    return $ProjectLogsTable(attachedDatabase, alias);
  }
}

class ProjectLog extends DataClass implements Insertable<ProjectLog> {
  final int id;
  final int proyekId;
  final String userId;
  final String aktivitas;
  final String waktu;
  const ProjectLog({
    required this.id,
    required this.proyekId,
    required this.userId,
    required this.aktivitas,
    required this.waktu,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    map['user_id'] = Variable<String>(userId);
    map['aktivitas'] = Variable<String>(aktivitas);
    map['waktu'] = Variable<String>(waktu);
    return map;
  }

  ProjectLogsCompanion toCompanion(bool nullToAbsent) {
    return ProjectLogsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      userId: Value(userId),
      aktivitas: Value(aktivitas),
      waktu: Value(waktu),
    );
  }

  factory ProjectLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectLog(
      id: serializer.fromJson<int>(json['id']),
      proyekId: serializer.fromJson<int>(json['proyekId']),
      userId: serializer.fromJson<String>(json['userId']),
      aktivitas: serializer.fromJson<String>(json['aktivitas']),
      waktu: serializer.fromJson<String>(json['waktu']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'userId': serializer.toJson<String>(userId),
      'aktivitas': serializer.toJson<String>(aktivitas),
      'waktu': serializer.toJson<String>(waktu),
    };
  }

  ProjectLog copyWith({
    int? id,
    int? proyekId,
    String? userId,
    String? aktivitas,
    String? waktu,
  }) => ProjectLog(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    userId: userId ?? this.userId,
    aktivitas: aktivitas ?? this.aktivitas,
    waktu: waktu ?? this.waktu,
  );
  ProjectLog copyWithCompanion(ProjectLogsCompanion data) {
    return ProjectLog(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      userId: data.userId.present ? data.userId.value : this.userId,
      aktivitas: data.aktivitas.present ? data.aktivitas.value : this.aktivitas,
      waktu: data.waktu.present ? data.waktu.value : this.waktu,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectLog(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('userId: $userId, ')
          ..write('aktivitas: $aktivitas, ')
          ..write('waktu: $waktu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, proyekId, userId, aktivitas, waktu);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectLog &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.userId == this.userId &&
          other.aktivitas == this.aktivitas &&
          other.waktu == this.waktu);
}

class ProjectLogsCompanion extends UpdateCompanion<ProjectLog> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<String> userId;
  final Value<String> aktivitas;
  final Value<String> waktu;
  const ProjectLogsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.userId = const Value.absent(),
    this.aktivitas = const Value.absent(),
    this.waktu = const Value.absent(),
  });
  ProjectLogsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    required String userId,
    required String aktivitas,
    required String waktu,
  }) : proyekId = Value(proyekId),
       userId = Value(userId),
       aktivitas = Value(aktivitas),
       waktu = Value(waktu);
  static Insertable<ProjectLog> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<String>? userId,
    Expression<String>? aktivitas,
    Expression<String>? waktu,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (userId != null) 'user_id': userId,
      if (aktivitas != null) 'aktivitas': aktivitas,
      if (waktu != null) 'waktu': waktu,
    });
  }

  ProjectLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<String>? userId,
    Value<String>? aktivitas,
    Value<String>? waktu,
  }) {
    return ProjectLogsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      userId: userId ?? this.userId,
      aktivitas: aktivitas ?? this.aktivitas,
      waktu: waktu ?? this.waktu,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proyekId.present) {
      map['proyek_id'] = Variable<int>(proyekId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (aktivitas.present) {
      map['aktivitas'] = Variable<String>(aktivitas.value);
    }
    if (waktu.present) {
      map['waktu'] = Variable<String>(waktu.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectLogsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('userId: $userId, ')
          ..write('aktivitas: $aktivitas, ')
          ..write('waktu: $waktu')
          ..write(')'))
        .toString();
  }
}

class $LoginHistoryTable extends LoginHistory
    with TableInfo<$LoginHistoryTable, LoginHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoginHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid)',
    ),
  );
  static const VerificationMeta _perangkatMeta = const VerificationMeta(
    'perangkat',
  );
  @override
  late final GeneratedColumn<String> perangkat = GeneratedColumn<String>(
    'perangkat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lokasiMeta = const VerificationMeta('lokasi');
  @override
  late final GeneratedColumn<String> lokasi = GeneratedColumn<String>(
    'lokasi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _waktuLoginMeta = const VerificationMeta(
    'waktuLogin',
  );
  @override
  late final GeneratedColumn<String> waktuLogin = GeneratedColumn<String>(
    'waktu_login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    perangkat,
    lokasi,
    waktuLogin,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'login_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoginHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('perangkat')) {
      context.handle(
        _perangkatMeta,
        perangkat.isAcceptableOrUnknown(data['perangkat']!, _perangkatMeta),
      );
    } else if (isInserting) {
      context.missing(_perangkatMeta);
    }
    if (data.containsKey('lokasi')) {
      context.handle(
        _lokasiMeta,
        lokasi.isAcceptableOrUnknown(data['lokasi']!, _lokasiMeta),
      );
    }
    if (data.containsKey('waktu_login')) {
      context.handle(
        _waktuLoginMeta,
        waktuLogin.isAcceptableOrUnknown(data['waktu_login']!, _waktuLoginMeta),
      );
    } else if (isInserting) {
      context.missing(_waktuLoginMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoginHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoginHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      perangkat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}perangkat'],
      )!,
      lokasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lokasi'],
      ),
      waktuLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}waktu_login'],
      )!,
    );
  }

  @override
  $LoginHistoryTable createAlias(String alias) {
    return $LoginHistoryTable(attachedDatabase, alias);
  }
}

class LoginHistoryData extends DataClass
    implements Insertable<LoginHistoryData> {
  final int id;
  final String userId;
  final String perangkat;
  final String? lokasi;
  final String waktuLogin;
  const LoginHistoryData({
    required this.id,
    required this.userId,
    required this.perangkat,
    this.lokasi,
    required this.waktuLogin,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['perangkat'] = Variable<String>(perangkat);
    if (!nullToAbsent || lokasi != null) {
      map['lokasi'] = Variable<String>(lokasi);
    }
    map['waktu_login'] = Variable<String>(waktuLogin);
    return map;
  }

  LoginHistoryCompanion toCompanion(bool nullToAbsent) {
    return LoginHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      perangkat: Value(perangkat),
      lokasi: lokasi == null && nullToAbsent
          ? const Value.absent()
          : Value(lokasi),
      waktuLogin: Value(waktuLogin),
    );
  }

  factory LoginHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoginHistoryData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      perangkat: serializer.fromJson<String>(json['perangkat']),
      lokasi: serializer.fromJson<String?>(json['lokasi']),
      waktuLogin: serializer.fromJson<String>(json['waktuLogin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'perangkat': serializer.toJson<String>(perangkat),
      'lokasi': serializer.toJson<String?>(lokasi),
      'waktuLogin': serializer.toJson<String>(waktuLogin),
    };
  }

  LoginHistoryData copyWith({
    int? id,
    String? userId,
    String? perangkat,
    Value<String?> lokasi = const Value.absent(),
    String? waktuLogin,
  }) => LoginHistoryData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    perangkat: perangkat ?? this.perangkat,
    lokasi: lokasi.present ? lokasi.value : this.lokasi,
    waktuLogin: waktuLogin ?? this.waktuLogin,
  );
  LoginHistoryData copyWithCompanion(LoginHistoryCompanion data) {
    return LoginHistoryData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      perangkat: data.perangkat.present ? data.perangkat.value : this.perangkat,
      lokasi: data.lokasi.present ? data.lokasi.value : this.lokasi,
      waktuLogin: data.waktuLogin.present
          ? data.waktuLogin.value
          : this.waktuLogin,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoginHistoryData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('perangkat: $perangkat, ')
          ..write('lokasi: $lokasi, ')
          ..write('waktuLogin: $waktuLogin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, perangkat, lokasi, waktuLogin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoginHistoryData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.perangkat == this.perangkat &&
          other.lokasi == this.lokasi &&
          other.waktuLogin == this.waktuLogin);
}

class LoginHistoryCompanion extends UpdateCompanion<LoginHistoryData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> perangkat;
  final Value<String?> lokasi;
  final Value<String> waktuLogin;
  const LoginHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.perangkat = const Value.absent(),
    this.lokasi = const Value.absent(),
    this.waktuLogin = const Value.absent(),
  });
  LoginHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String perangkat,
    this.lokasi = const Value.absent(),
    required String waktuLogin,
  }) : userId = Value(userId),
       perangkat = Value(perangkat),
       waktuLogin = Value(waktuLogin);
  static Insertable<LoginHistoryData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? perangkat,
    Expression<String>? lokasi,
    Expression<String>? waktuLogin,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (perangkat != null) 'perangkat': perangkat,
      if (lokasi != null) 'lokasi': lokasi,
      if (waktuLogin != null) 'waktu_login': waktuLogin,
    });
  }

  LoginHistoryCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? perangkat,
    Value<String?>? lokasi,
    Value<String>? waktuLogin,
  }) {
    return LoginHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      perangkat: perangkat ?? this.perangkat,
      lokasi: lokasi ?? this.lokasi,
      waktuLogin: waktuLogin ?? this.waktuLogin,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (perangkat.present) {
      map['perangkat'] = Variable<String>(perangkat.value);
    }
    if (lokasi.present) {
      map['lokasi'] = Variable<String>(lokasi.value);
    }
    if (waktuLogin.present) {
      map['waktu_login'] = Variable<String>(waktuLogin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoginHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('perangkat: $perangkat, ')
          ..write('lokasi: $lokasi, ')
          ..write('waktuLogin: $waktuLogin')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PerusahaanTable perusahaan = $PerusahaanTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ReportMaterialsTable reportMaterials = $ReportMaterialsTable(
    this,
  );
  late final $ReportPhotosTable reportPhotos = $ReportPhotosTable(this);
  late final $ProjectTeamsTable projectTeams = $ProjectTeamsTable(this);
  late final $DocumentFoldersTable documentFolders = $DocumentFoldersTable(
    this,
  );
  late final $ProjectDocumentsTable projectDocuments = $ProjectDocumentsTable(
    this,
  );
  late final $ProjectLogsTable projectLogs = $ProjectLogsTable(this);
  late final $LoginHistoryTable loginHistory = $LoginHistoryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    perusahaan,
    users,
    projects,
    reports,
    tasks,
    reportMaterials,
    reportPhotos,
    projectTeams,
    documentFolders,
    projectDocuments,
    projectLogs,
    loginHistory,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reports', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reports', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'reports',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PerusahaanTableCreateCompanionBuilder =
    PerusahaanCompanion Function({
      Value<int> id,
      required String namaPerusahaan,
      Value<String?> alamat,
    });
typedef $$PerusahaanTableUpdateCompanionBuilder =
    PerusahaanCompanion Function({
      Value<int> id,
      Value<String> namaPerusahaan,
      Value<String?> alamat,
    });

final class $$PerusahaanTableReferences
    extends BaseReferences<_$AppDatabase, $PerusahaanTable, PerusahaanData> {
  $$PerusahaanTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.perusahaan.id, db.users.perusahaanId),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.perusahaanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PerusahaanTableFilterComposer
    extends Composer<_$AppDatabase, $PerusahaanTable> {
  $$PerusahaanTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaPerusahaan => $composableBuilder(
    column: $table.namaPerusahaan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.perusahaanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PerusahaanTableOrderingComposer
    extends Composer<_$AppDatabase, $PerusahaanTable> {
  $$PerusahaanTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaPerusahaan => $composableBuilder(
    column: $table.namaPerusahaan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PerusahaanTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerusahaanTable> {
  $$PerusahaanTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaPerusahaan => $composableBuilder(
    column: $table.namaPerusahaan,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.perusahaanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PerusahaanTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PerusahaanTable,
          PerusahaanData,
          $$PerusahaanTableFilterComposer,
          $$PerusahaanTableOrderingComposer,
          $$PerusahaanTableAnnotationComposer,
          $$PerusahaanTableCreateCompanionBuilder,
          $$PerusahaanTableUpdateCompanionBuilder,
          (PerusahaanData, $$PerusahaanTableReferences),
          PerusahaanData,
          PrefetchHooks Function({bool usersRefs})
        > {
  $$PerusahaanTableTableManager(_$AppDatabase db, $PerusahaanTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerusahaanTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PerusahaanTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerusahaanTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> namaPerusahaan = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
              }) => PerusahaanCompanion(
                id: id,
                namaPerusahaan: namaPerusahaan,
                alamat: alamat,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaPerusahaan,
                Value<String?> alamat = const Value.absent(),
              }) => PerusahaanCompanion.insert(
                id: id,
                namaPerusahaan: namaPerusahaan,
                alamat: alamat,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PerusahaanTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<
                      PerusahaanData,
                      $PerusahaanTable,
                      User
                    >(
                      currentTable: table,
                      referencedTable: $$PerusahaanTableReferences
                          ._usersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PerusahaanTableReferences(db, table, p0).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.perusahaanId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PerusahaanTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PerusahaanTable,
      PerusahaanData,
      $$PerusahaanTableFilterComposer,
      $$PerusahaanTableOrderingComposer,
      $$PerusahaanTableAnnotationComposer,
      $$PerusahaanTableCreateCompanionBuilder,
      $$PerusahaanTableUpdateCompanionBuilder,
      (PerusahaanData, $$PerusahaanTableReferences),
      PerusahaanData,
      PrefetchHooks Function({bool usersRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String firebaseUid,
      required String nama,
      Value<String?> username,
      required String peran,
      Value<int?> perusahaanId,
      Value<String?> nomorHp,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> firebaseUid,
      Value<String> nama,
      Value<String?> username,
      Value<String> peran,
      Value<int?> perusahaanId,
      Value<String?> nomorHp,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PerusahaanTable _perusahaanIdTable(_$AppDatabase db) =>
      db.perusahaan.createAlias(
        $_aliasNameGenerator(db.users.perusahaanId, db.perusahaan.id),
      );

  $$PerusahaanTableProcessedTableManager? get perusahaanId {
    final $_column = $_itemColumn<int>('perusahaan_id');
    if ($_column == null) return null;
    final manager = $$PerusahaanTableTableManager(
      $_db,
      $_db.perusahaan,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_perusahaanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.reports.pengawasId,
    ),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager($_db, $_db.reports).filter(
      (f) => f.pengawasId.firebaseUid.sqlEquals(
        $_itemColumn<String>('firebase_uid')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectTeamsTable, List<ProjectTeam>>
  _projectTeamsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectTeams,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.projectTeams.userId,
    ),
  );

  $$ProjectTeamsTableProcessedTableManager get projectTeamsRefs {
    final manager = $$ProjectTeamsTableTableManager($_db, $_db.projectTeams)
        .filter(
          (f) => f.userId.firebaseUid.sqlEquals(
            $_itemColumn<String>('firebase_uid')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_projectTeamsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectDocumentsTable, List<ProjectDocument>>
  _projectDocumentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectDocuments,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.projectDocuments.diunggahOleh,
    ),
  );

  $$ProjectDocumentsTableProcessedTableManager get projectDocumentsRefs {
    final manager =
        $$ProjectDocumentsTableTableManager($_db, $_db.projectDocuments).filter(
          (f) => f.diunggahOleh.firebaseUid.sqlEquals(
            $_itemColumn<String>('firebase_uid')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _projectDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectLogsTable, List<ProjectLog>>
  _projectLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectLogs,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.projectLogs.userId,
    ),
  );

  $$ProjectLogsTableProcessedTableManager get projectLogsRefs {
    final manager = $$ProjectLogsTableTableManager($_db, $_db.projectLogs)
        .filter(
          (f) => f.userId.firebaseUid.sqlEquals(
            $_itemColumn<String>('firebase_uid')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_projectLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LoginHistoryTable, List<LoginHistoryData>>
  _loginHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.loginHistory,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.loginHistory.userId,
    ),
  );

  $$LoginHistoryTableProcessedTableManager get loginHistoryRefs {
    final manager = $$LoginHistoryTableTableManager($_db, $_db.loginHistory)
        .filter(
          (f) => f.userId.firebaseUid.sqlEquals(
            $_itemColumn<String>('firebase_uid')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_loginHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get peran => $composableBuilder(
    column: $table.peran,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomorHp => $composableBuilder(
    column: $table.nomorHp,
    builder: (column) => ColumnFilters(column),
  );

  $$PerusahaanTableFilterComposer get perusahaanId {
    final $$PerusahaanTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.perusahaanId,
      referencedTable: $db.perusahaan,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PerusahaanTableFilterComposer(
            $db: $db,
            $table: $db.perusahaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.pengawasId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectTeamsRefs(
    Expression<bool> Function($$ProjectTeamsTableFilterComposer f) f,
  ) {
    final $$ProjectTeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectTeams,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTeamsTableFilterComposer(
            $db: $db,
            $table: $db.projectTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectDocumentsRefs(
    Expression<bool> Function($$ProjectDocumentsTableFilterComposer f) f,
  ) {
    final $$ProjectDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.diunggahOleh,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectLogsRefs(
    Expression<bool> Function($$ProjectLogsTableFilterComposer f) f,
  ) {
    final $$ProjectLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectLogsTableFilterComposer(
            $db: $db,
            $table: $db.projectLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> loginHistoryRefs(
    Expression<bool> Function($$LoginHistoryTableFilterComposer f) f,
  ) {
    final $$LoginHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.loginHistory,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoginHistoryTableFilterComposer(
            $db: $db,
            $table: $db.loginHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get peran => $composableBuilder(
    column: $table.peran,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomorHp => $composableBuilder(
    column: $table.nomorHp,
    builder: (column) => ColumnOrderings(column),
  );

  $$PerusahaanTableOrderingComposer get perusahaanId {
    final $$PerusahaanTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.perusahaanId,
      referencedTable: $db.perusahaan,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PerusahaanTableOrderingComposer(
            $db: $db,
            $table: $db.perusahaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get peran =>
      $composableBuilder(column: $table.peran, builder: (column) => column);

  GeneratedColumn<String> get nomorHp =>
      $composableBuilder(column: $table.nomorHp, builder: (column) => column);

  $$PerusahaanTableAnnotationComposer get perusahaanId {
    final $$PerusahaanTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.perusahaanId,
      referencedTable: $db.perusahaan,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PerusahaanTableAnnotationComposer(
            $db: $db,
            $table: $db.perusahaan,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.pengawasId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectTeamsRefs<T extends Object>(
    Expression<T> Function($$ProjectTeamsTableAnnotationComposer a) f,
  ) {
    final $$ProjectTeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectTeams,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectDocumentsRefs<T extends Object>(
    Expression<T> Function($$ProjectDocumentsTableAnnotationComposer a) f,
  ) {
    final $$ProjectDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.diunggahOleh,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectLogsRefs<T extends Object>(
    Expression<T> Function($$ProjectLogsTableAnnotationComposer a) f,
  ) {
    final $$ProjectLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.projectLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> loginHistoryRefs<T extends Object>(
    Expression<T> Function($$LoginHistoryTableAnnotationComposer a) f,
  ) {
    final $$LoginHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.loginHistory,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoginHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.loginHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool perusahaanId,
            bool reportsRefs,
            bool projectTeamsRefs,
            bool projectDocumentsRefs,
            bool projectLogsRefs,
            bool loginHistoryRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> firebaseUid = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<String> peran = const Value.absent(),
                Value<int?> perusahaanId = const Value.absent(),
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                firebaseUid: firebaseUid,
                nama: nama,
                username: username,
                peran: peran,
                perusahaanId: perusahaanId,
                nomorHp: nomorHp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String firebaseUid,
                required String nama,
                Value<String?> username = const Value.absent(),
                required String peran,
                Value<int?> perusahaanId = const Value.absent(),
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                firebaseUid: firebaseUid,
                nama: nama,
                username: username,
                peran: peran,
                perusahaanId: perusahaanId,
                nomorHp: nomorHp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                perusahaanId = false,
                reportsRefs = false,
                projectTeamsRefs = false,
                projectDocumentsRefs = false,
                projectLogsRefs = false,
                loginHistoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reportsRefs) db.reports,
                    if (projectTeamsRefs) db.projectTeams,
                    if (projectDocumentsRefs) db.projectDocuments,
                    if (projectLogsRefs) db.projectLogs,
                    if (loginHistoryRefs) db.loginHistory,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (perusahaanId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.perusahaanId,
                                    referencedTable: $$UsersTableReferences
                                        ._perusahaanIdTable(db),
                                    referencedColumn: $$UsersTableReferences
                                        ._perusahaanIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reportsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Report>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._reportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).reportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pengawasId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (projectTeamsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ProjectTeam
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._projectTeamsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).projectTeamsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (projectDocumentsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ProjectDocument
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._projectDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).projectDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.diunggahOleh == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (projectLogsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ProjectLog
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._projectLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).projectLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (loginHistoryRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          LoginHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._loginHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).loginHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool perusahaanId,
        bool reportsRefs,
        bool projectTeamsRefs,
        bool projectDocumentsRefs,
        bool projectLogsRefs,
        bool loginHistoryRefs,
      })
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      required String namaProyek,
      Value<String?> lokasi,
      Value<String?> tanggalMulai,
      Value<String> status,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      Value<String> namaProyek,
      Value<String?> lokasi,
      Value<String?> tanggalMulai,
      Value<String> status,
    });

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(db.projects.id, db.reports.proyekId),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.proyekId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectTeamsTable, List<ProjectTeam>>
  _projectTeamsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectTeams,
    aliasName: $_aliasNameGenerator(db.projects.id, db.projectTeams.proyekId),
  );

  $$ProjectTeamsTableProcessedTableManager get projectTeamsRefs {
    final manager = $$ProjectTeamsTableTableManager(
      $_db,
      $_db.projectTeams,
    ).filter((f) => f.proyekId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectTeamsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectDocumentsTable, List<ProjectDocument>>
  _projectDocumentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectDocuments,
    aliasName: $_aliasNameGenerator(
      db.projects.id,
      db.projectDocuments.proyekId,
    ),
  );

  $$ProjectDocumentsTableProcessedTableManager get projectDocumentsRefs {
    final manager = $$ProjectDocumentsTableTableManager(
      $_db,
      $_db.projectDocuments,
    ).filter((f) => f.proyekId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _projectDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectLogsTable, List<ProjectLog>>
  _projectLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectLogs,
    aliasName: $_aliasNameGenerator(db.projects.id, db.projectLogs.proyekId),
  );

  $$ProjectLogsTableProcessedTableManager get projectLogsRefs {
    final manager = $$ProjectLogsTableTableManager(
      $_db,
      $_db.projectLogs,
    ).filter((f) => f.proyekId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaProyek => $composableBuilder(
    column: $table.namaProyek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectTeamsRefs(
    Expression<bool> Function($$ProjectTeamsTableFilterComposer f) f,
  ) {
    final $$ProjectTeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectTeams,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTeamsTableFilterComposer(
            $db: $db,
            $table: $db.projectTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectDocumentsRefs(
    Expression<bool> Function($$ProjectDocumentsTableFilterComposer f) f,
  ) {
    final $$ProjectDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectLogsRefs(
    Expression<bool> Function($$ProjectLogsTableFilterComposer f) f,
  ) {
    final $$ProjectLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectLogs,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectLogsTableFilterComposer(
            $db: $db,
            $table: $db.projectLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaProyek => $composableBuilder(
    column: $table.namaProyek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaProyek => $composableBuilder(
    column: $table.namaProyek,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lokasi =>
      $composableBuilder(column: $table.lokasi, builder: (column) => column);

  GeneratedColumn<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectTeamsRefs<T extends Object>(
    Expression<T> Function($$ProjectTeamsTableAnnotationComposer a) f,
  ) {
    final $$ProjectTeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectTeams,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectTeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectTeams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectDocumentsRefs<T extends Object>(
    Expression<T> Function($$ProjectDocumentsTableAnnotationComposer a) f,
  ) {
    final $$ProjectDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectLogsRefs<T extends Object>(
    Expression<T> Function($$ProjectLogsTableAnnotationComposer a) f,
  ) {
    final $$ProjectLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectLogs,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, $$ProjectsTableReferences),
          Project,
          PrefetchHooks Function({
            bool reportsRefs,
            bool projectTeamsRefs,
            bool projectDocumentsRefs,
            bool projectLogsRefs,
          })
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> namaProyek = const Value.absent(),
                Value<String?> lokasi = const Value.absent(),
                Value<String?> tanggalMulai = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                namaProyek: namaProyek,
                lokasi: lokasi,
                tanggalMulai: tanggalMulai,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaProyek,
                Value<String?> lokasi = const Value.absent(),
                Value<String?> tanggalMulai = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                namaProyek: namaProyek,
                lokasi: lokasi,
                tanggalMulai: tanggalMulai,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                reportsRefs = false,
                projectTeamsRefs = false,
                projectDocumentsRefs = false,
                projectLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reportsRefs) db.reports,
                    if (projectTeamsRefs) db.projectTeams,
                    if (projectDocumentsRefs) db.projectDocuments,
                    if (projectLogsRefs) db.projectLogs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reportsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Report
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._reportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).reportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.proyekId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectTeamsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          ProjectTeam
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._projectTeamsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).projectTeamsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.proyekId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectDocumentsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          ProjectDocument
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._projectDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).projectDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.proyekId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectLogsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          ProjectLog
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._projectLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).projectLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.proyekId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, $$ProjectsTableReferences),
      Project,
      PrefetchHooks Function({
        bool reportsRefs,
        bool projectTeamsRefs,
        bool projectDocumentsRefs,
        bool projectLogsRefs,
      })
    >;
typedef $$ReportsTableCreateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      required int proyekId,
      Value<String?> pengawasId,
      required String tanggal,
      Value<String?> deskripsi,
      Value<String?> fotoUrl,
      Value<int> progress,
      Value<String> status,
    });
typedef $$ReportsTableUpdateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<String?> pengawasId,
      Value<String> tanggal,
      Value<String?> deskripsi,
      Value<String?> fotoUrl,
      Value<int> progress,
      Value<String> status,
    });

final class $$ReportsTableReferences
    extends BaseReferences<_$AppDatabase, $ReportsTable, Report> {
  $$ReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _proyekIdTable(_$AppDatabase db) => db.projects
      .createAlias($_aliasNameGenerator(db.reports.proyekId, db.projects.id));

  $$ProjectsTableProcessedTableManager get proyekId {
    final $_column = $_itemColumn<int>('proyek_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_proyekIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _pengawasIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.reports.pengawasId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager? get pengawasId {
    final $_column = $_itemColumn<String>('pengawas_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pengawasIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.reports.id, db.tasks.reportId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.reportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReportMaterialsTable, List<ReportMaterial>>
  _reportMaterialsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reportMaterials,
    aliasName: $_aliasNameGenerator(db.reports.id, db.reportMaterials.reportId),
  );

  $$ReportMaterialsTableProcessedTableManager get reportMaterialsRefs {
    final manager = $$ReportMaterialsTableTableManager(
      $_db,
      $_db.reportMaterials,
    ).filter((f) => f.reportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reportMaterialsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReportPhotosTable, List<ReportPhoto>>
  _reportPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reportPhotos,
    aliasName: $_aliasNameGenerator(db.reports.id, db.reportPhotos.reportId),
  );

  $$ReportPhotosTableProcessedTableManager get reportPhotosRefs {
    final manager = $$ReportPhotosTableTableManager(
      $_db,
      $_db.reportPhotos,
    ).filter((f) => f.reportId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_reportPhotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ReportsTableFilterComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggal => $composableBuilder(
    column: $table.tanggal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoUrl => $composableBuilder(
    column: $table.fotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get proyekId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get pengawasId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pengawasId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reportMaterialsRefs(
    Expression<bool> Function($$ReportMaterialsTableFilterComposer f) f,
  ) {
    final $$ReportMaterialsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reportMaterials,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportMaterialsTableFilterComposer(
            $db: $db,
            $table: $db.reportMaterials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reportPhotosRefs(
    Expression<bool> Function($$ReportPhotosTableFilterComposer f) f,
  ) {
    final $$ReportPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reportPhotos,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportPhotosTableFilterComposer(
            $db: $db,
            $table: $db.reportPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggal => $composableBuilder(
    column: $table.tanggal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoUrl => $composableBuilder(
    column: $table.fotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get proyekId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get pengawasId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pengawasId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReportsTable> {
  $$ReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tanggal =>
      $composableBuilder(column: $table.tanggal, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get fotoUrl =>
      $composableBuilder(column: $table.fotoUrl, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get proyekId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get pengawasId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pengawasId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reportMaterialsRefs<T extends Object>(
    Expression<T> Function($$ReportMaterialsTableAnnotationComposer a) f,
  ) {
    final $$ReportMaterialsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reportMaterials,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportMaterialsTableAnnotationComposer(
            $db: $db,
            $table: $db.reportMaterials,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reportPhotosRefs<T extends Object>(
    Expression<T> Function($$ReportPhotosTableAnnotationComposer a) f,
  ) {
    final $$ReportPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reportPhotos,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.reportPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReportsTable,
          Report,
          $$ReportsTableFilterComposer,
          $$ReportsTableOrderingComposer,
          $$ReportsTableAnnotationComposer,
          $$ReportsTableCreateCompanionBuilder,
          $$ReportsTableUpdateCompanionBuilder,
          (Report, $$ReportsTableReferences),
          Report,
          PrefetchHooks Function({
            bool proyekId,
            bool pengawasId,
            bool tasksRefs,
            bool reportMaterialsRefs,
            bool reportPhotosRefs,
          })
        > {
  $$ReportsTableTableManager(_$AppDatabase db, $ReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proyekId = const Value.absent(),
                Value<String?> pengawasId = const Value.absent(),
                Value<String> tanggal = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoUrl = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ReportsCompanion(
                id: id,
                proyekId: proyekId,
                pengawasId: pengawasId,
                tanggal: tanggal,
                deskripsi: deskripsi,
                fotoUrl: fotoUrl,
                progress: progress,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                Value<String?> pengawasId = const Value.absent(),
                required String tanggal,
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoUrl = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ReportsCompanion.insert(
                id: id,
                proyekId: proyekId,
                pengawasId: pengawasId,
                tanggal: tanggal,
                deskripsi: deskripsi,
                fotoUrl: fotoUrl,
                progress: progress,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                proyekId = false,
                pengawasId = false,
                tasksRefs = false,
                reportMaterialsRefs = false,
                reportPhotosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tasksRefs) db.tasks,
                    if (reportMaterialsRefs) db.reportMaterials,
                    if (reportPhotosRefs) db.reportPhotos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (proyekId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.proyekId,
                                    referencedTable: $$ReportsTableReferences
                                        ._proyekIdTable(db),
                                    referencedColumn: $$ReportsTableReferences
                                        ._proyekIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (pengawasId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pengawasId,
                                    referencedTable: $$ReportsTableReferences
                                        ._pengawasIdTable(db),
                                    referencedColumn: $$ReportsTableReferences
                                        ._pengawasIdTable(db)
                                        .firebaseUid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tasksRefs)
                        await $_getPrefetchedData<Report, $ReportsTable, Task>(
                          currentTable: table,
                          referencedTable: $$ReportsTableReferences
                              ._tasksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReportsTableReferences(db, table, p0).tasksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reportId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reportMaterialsRefs)
                        await $_getPrefetchedData<
                          Report,
                          $ReportsTable,
                          ReportMaterial
                        >(
                          currentTable: table,
                          referencedTable: $$ReportsTableReferences
                              ._reportMaterialsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReportsTableReferences(
                                db,
                                table,
                                p0,
                              ).reportMaterialsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reportId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reportPhotosRefs)
                        await $_getPrefetchedData<
                          Report,
                          $ReportsTable,
                          ReportPhoto
                        >(
                          currentTable: table,
                          referencedTable: $$ReportsTableReferences
                              ._reportPhotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ReportsTableReferences(
                                db,
                                table,
                                p0,
                              ).reportPhotosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.reportId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReportsTable,
      Report,
      $$ReportsTableFilterComposer,
      $$ReportsTableOrderingComposer,
      $$ReportsTableAnnotationComposer,
      $$ReportsTableCreateCompanionBuilder,
      $$ReportsTableUpdateCompanionBuilder,
      (Report, $$ReportsTableReferences),
      Report,
      PrefetchHooks Function({
        bool proyekId,
        bool pengawasId,
        bool tasksRefs,
        bool reportMaterialsRefs,
        bool reportPhotosRefs,
      })
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required int reportId,
      required String namaPekerjaan,
      Value<bool> isSelesai,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<int> reportId,
      Value<String> namaPekerjaan,
      Value<bool> isSelesai,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ReportsTable _reportIdTable(_$AppDatabase db) => db.reports
      .createAlias($_aliasNameGenerator(db.tasks.reportId, db.reports.id));

  $$ReportsTableProcessedTableManager get reportId {
    final $_column = $_itemColumn<int>('report_id')!;

    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaPekerjaan => $composableBuilder(
    column: $table.namaPekerjaan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelesai => $composableBuilder(
    column: $table.isSelesai,
    builder: (column) => ColumnFilters(column),
  );

  $$ReportsTableFilterComposer get reportId {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaPekerjaan => $composableBuilder(
    column: $table.namaPekerjaan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelesai => $composableBuilder(
    column: $table.isSelesai,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReportsTableOrderingComposer get reportId {
    final $$ReportsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableOrderingComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaPekerjaan => $composableBuilder(
    column: $table.namaPekerjaan,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSelesai =>
      $composableBuilder(column: $table.isSelesai, builder: (column) => column);

  $$ReportsTableAnnotationComposer get reportId {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({bool reportId})
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> reportId = const Value.absent(),
                Value<String> namaPekerjaan = const Value.absent(),
                Value<bool> isSelesai = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                reportId: reportId,
                namaPekerjaan: namaPekerjaan,
                isSelesai: isSelesai,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reportId,
                required String namaPekerjaan,
                Value<bool> isSelesai = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                reportId: reportId,
                namaPekerjaan: namaPekerjaan,
                isSelesai: isSelesai,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({reportId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (reportId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reportId,
                                referencedTable: $$TasksTableReferences
                                    ._reportIdTable(db),
                                referencedColumn: $$TasksTableReferences
                                    ._reportIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({bool reportId})
    >;
typedef $$ReportMaterialsTableCreateCompanionBuilder =
    ReportMaterialsCompanion Function({
      Value<int> id,
      required int reportId,
      required String namaMaterial,
      required String satuan,
      required double volume,
    });
typedef $$ReportMaterialsTableUpdateCompanionBuilder =
    ReportMaterialsCompanion Function({
      Value<int> id,
      Value<int> reportId,
      Value<String> namaMaterial,
      Value<String> satuan,
      Value<double> volume,
    });

final class $$ReportMaterialsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ReportMaterialsTable, ReportMaterial> {
  $$ReportMaterialsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ReportsTable _reportIdTable(_$AppDatabase db) =>
      db.reports.createAlias(
        $_aliasNameGenerator(db.reportMaterials.reportId, db.reports.id),
      );

  $$ReportsTableProcessedTableManager get reportId {
    final $_column = $_itemColumn<int>('report_id')!;

    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReportMaterialsTableFilterComposer
    extends Composer<_$AppDatabase, $ReportMaterialsTable> {
  $$ReportMaterialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaMaterial => $composableBuilder(
    column: $table.namaMaterial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get satuan => $composableBuilder(
    column: $table.satuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  $$ReportsTableFilterComposer get reportId {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportMaterialsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReportMaterialsTable> {
  $$ReportMaterialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaMaterial => $composableBuilder(
    column: $table.namaMaterial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get satuan => $composableBuilder(
    column: $table.satuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReportsTableOrderingComposer get reportId {
    final $$ReportsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableOrderingComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportMaterialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReportMaterialsTable> {
  $$ReportMaterialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaMaterial => $composableBuilder(
    column: $table.namaMaterial,
    builder: (column) => column,
  );

  GeneratedColumn<String> get satuan =>
      $composableBuilder(column: $table.satuan, builder: (column) => column);

  GeneratedColumn<double> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  $$ReportsTableAnnotationComposer get reportId {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportMaterialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReportMaterialsTable,
          ReportMaterial,
          $$ReportMaterialsTableFilterComposer,
          $$ReportMaterialsTableOrderingComposer,
          $$ReportMaterialsTableAnnotationComposer,
          $$ReportMaterialsTableCreateCompanionBuilder,
          $$ReportMaterialsTableUpdateCompanionBuilder,
          (ReportMaterial, $$ReportMaterialsTableReferences),
          ReportMaterial,
          PrefetchHooks Function({bool reportId})
        > {
  $$ReportMaterialsTableTableManager(
    _$AppDatabase db,
    $ReportMaterialsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportMaterialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportMaterialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportMaterialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> reportId = const Value.absent(),
                Value<String> namaMaterial = const Value.absent(),
                Value<String> satuan = const Value.absent(),
                Value<double> volume = const Value.absent(),
              }) => ReportMaterialsCompanion(
                id: id,
                reportId: reportId,
                namaMaterial: namaMaterial,
                satuan: satuan,
                volume: volume,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reportId,
                required String namaMaterial,
                required String satuan,
                required double volume,
              }) => ReportMaterialsCompanion.insert(
                id: id,
                reportId: reportId,
                namaMaterial: namaMaterial,
                satuan: satuan,
                volume: volume,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReportMaterialsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reportId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (reportId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reportId,
                                referencedTable:
                                    $$ReportMaterialsTableReferences
                                        ._reportIdTable(db),
                                referencedColumn:
                                    $$ReportMaterialsTableReferences
                                        ._reportIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReportMaterialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReportMaterialsTable,
      ReportMaterial,
      $$ReportMaterialsTableFilterComposer,
      $$ReportMaterialsTableOrderingComposer,
      $$ReportMaterialsTableAnnotationComposer,
      $$ReportMaterialsTableCreateCompanionBuilder,
      $$ReportMaterialsTableUpdateCompanionBuilder,
      (ReportMaterial, $$ReportMaterialsTableReferences),
      ReportMaterial,
      PrefetchHooks Function({bool reportId})
    >;
typedef $$ReportPhotosTableCreateCompanionBuilder =
    ReportPhotosCompanion Function({
      Value<int> id,
      required int reportId,
      required String fotoUrl,
    });
typedef $$ReportPhotosTableUpdateCompanionBuilder =
    ReportPhotosCompanion Function({
      Value<int> id,
      Value<int> reportId,
      Value<String> fotoUrl,
    });

final class $$ReportPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $ReportPhotosTable, ReportPhoto> {
  $$ReportPhotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ReportsTable _reportIdTable(_$AppDatabase db) =>
      db.reports.createAlias(
        $_aliasNameGenerator(db.reportPhotos.reportId, db.reports.id),
      );

  $$ReportsTableProcessedTableManager get reportId {
    final $_column = $_itemColumn<int>('report_id')!;

    final manager = $$ReportsTableTableManager(
      $_db,
      $_db.reports,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReportPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $ReportPhotosTable> {
  $$ReportPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoUrl => $composableBuilder(
    column: $table.fotoUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$ReportsTableFilterComposer get reportId {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableFilterComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $ReportPhotosTable> {
  $$ReportPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoUrl => $composableBuilder(
    column: $table.fotoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$ReportsTableOrderingComposer get reportId {
    final $$ReportsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableOrderingComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReportPhotosTable> {
  $$ReportPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fotoUrl =>
      $composableBuilder(column: $table.fotoUrl, builder: (column) => column);

  $$ReportsTableAnnotationComposer get reportId {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.reports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReportPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReportPhotosTable,
          ReportPhoto,
          $$ReportPhotosTableFilterComposer,
          $$ReportPhotosTableOrderingComposer,
          $$ReportPhotosTableAnnotationComposer,
          $$ReportPhotosTableCreateCompanionBuilder,
          $$ReportPhotosTableUpdateCompanionBuilder,
          (ReportPhoto, $$ReportPhotosTableReferences),
          ReportPhoto,
          PrefetchHooks Function({bool reportId})
        > {
  $$ReportPhotosTableTableManager(_$AppDatabase db, $ReportPhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReportPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReportPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReportPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> reportId = const Value.absent(),
                Value<String> fotoUrl = const Value.absent(),
              }) => ReportPhotosCompanion(
                id: id,
                reportId: reportId,
                fotoUrl: fotoUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reportId,
                required String fotoUrl,
              }) => ReportPhotosCompanion.insert(
                id: id,
                reportId: reportId,
                fotoUrl: fotoUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReportPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reportId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (reportId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reportId,
                                referencedTable: $$ReportPhotosTableReferences
                                    ._reportIdTable(db),
                                referencedColumn: $$ReportPhotosTableReferences
                                    ._reportIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReportPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReportPhotosTable,
      ReportPhoto,
      $$ReportPhotosTableFilterComposer,
      $$ReportPhotosTableOrderingComposer,
      $$ReportPhotosTableAnnotationComposer,
      $$ReportPhotosTableCreateCompanionBuilder,
      $$ReportPhotosTableUpdateCompanionBuilder,
      (ReportPhoto, $$ReportPhotosTableReferences),
      ReportPhoto,
      PrefetchHooks Function({bool reportId})
    >;
typedef $$ProjectTeamsTableCreateCompanionBuilder =
    ProjectTeamsCompanion Function({
      Value<int> id,
      required int proyekId,
      required String userId,
      required String peranDiProyek,
    });
typedef $$ProjectTeamsTableUpdateCompanionBuilder =
    ProjectTeamsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<String> userId,
      Value<String> peranDiProyek,
    });

final class $$ProjectTeamsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectTeamsTable, ProjectTeam> {
  $$ProjectTeamsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _proyekIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
        $_aliasNameGenerator(db.projectTeams.proyekId, db.projects.id),
      );

  $$ProjectsTableProcessedTableManager get proyekId {
    final $_column = $_itemColumn<int>('proyek_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_proyekIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.projectTeams.userId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProjectTeamsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectTeamsTable> {
  $$ProjectTeamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get peranDiProyek => $composableBuilder(
    column: $table.peranDiProyek,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get proyekId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectTeamsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectTeamsTable> {
  $$ProjectTeamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get peranDiProyek => $composableBuilder(
    column: $table.peranDiProyek,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get proyekId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectTeamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectTeamsTable> {
  $$ProjectTeamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get peranDiProyek => $composableBuilder(
    column: $table.peranDiProyek,
    builder: (column) => column,
  );

  $$ProjectsTableAnnotationComposer get proyekId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectTeamsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectTeamsTable,
          ProjectTeam,
          $$ProjectTeamsTableFilterComposer,
          $$ProjectTeamsTableOrderingComposer,
          $$ProjectTeamsTableAnnotationComposer,
          $$ProjectTeamsTableCreateCompanionBuilder,
          $$ProjectTeamsTableUpdateCompanionBuilder,
          (ProjectTeam, $$ProjectTeamsTableReferences),
          ProjectTeam,
          PrefetchHooks Function({bool proyekId, bool userId})
        > {
  $$ProjectTeamsTableTableManager(_$AppDatabase db, $ProjectTeamsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTeamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTeamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTeamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proyekId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> peranDiProyek = const Value.absent(),
              }) => ProjectTeamsCompanion(
                id: id,
                proyekId: proyekId,
                userId: userId,
                peranDiProyek: peranDiProyek,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                required String userId,
                required String peranDiProyek,
              }) => ProjectTeamsCompanion.insert(
                id: id,
                proyekId: proyekId,
                userId: userId,
                peranDiProyek: peranDiProyek,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectTeamsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({proyekId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (proyekId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.proyekId,
                                referencedTable: $$ProjectTeamsTableReferences
                                    ._proyekIdTable(db),
                                referencedColumn: $$ProjectTeamsTableReferences
                                    ._proyekIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ProjectTeamsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ProjectTeamsTableReferences
                                    ._userIdTable(db)
                                    .firebaseUid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProjectTeamsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectTeamsTable,
      ProjectTeam,
      $$ProjectTeamsTableFilterComposer,
      $$ProjectTeamsTableOrderingComposer,
      $$ProjectTeamsTableAnnotationComposer,
      $$ProjectTeamsTableCreateCompanionBuilder,
      $$ProjectTeamsTableUpdateCompanionBuilder,
      (ProjectTeam, $$ProjectTeamsTableReferences),
      ProjectTeam,
      PrefetchHooks Function({bool proyekId, bool userId})
    >;
typedef $$DocumentFoldersTableCreateCompanionBuilder =
    DocumentFoldersCompanion Function({
      Value<int> id,
      required String namaFolder,
      Value<String?> kategori,
    });
typedef $$DocumentFoldersTableUpdateCompanionBuilder =
    DocumentFoldersCompanion Function({
      Value<int> id,
      Value<String> namaFolder,
      Value<String?> kategori,
    });

final class $$DocumentFoldersTableReferences
    extends
        BaseReferences<_$AppDatabase, $DocumentFoldersTable, DocumentFolder> {
  $$DocumentFoldersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ProjectDocumentsTable, List<ProjectDocument>>
  _projectDocumentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projectDocuments,
    aliasName: $_aliasNameGenerator(
      db.documentFolders.id,
      db.projectDocuments.folderId,
    ),
  );

  $$ProjectDocumentsTableProcessedTableManager get projectDocumentsRefs {
    final manager = $$ProjectDocumentsTableTableManager(
      $_db,
      $_db.projectDocuments,
    ).filter((f) => f.folderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _projectDocumentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DocumentFoldersTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentFoldersTable> {
  $$DocumentFoldersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaFolder => $composableBuilder(
    column: $table.namaFolder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> projectDocumentsRefs(
    Expression<bool> Function($$ProjectDocumentsTableFilterComposer f) f,
  ) {
    final $$ProjectDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.folderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentFoldersTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentFoldersTable> {
  $$DocumentFoldersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaFolder => $composableBuilder(
    column: $table.namaFolder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentFoldersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentFoldersTable> {
  $$DocumentFoldersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaFolder => $composableBuilder(
    column: $table.namaFolder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kategori =>
      $composableBuilder(column: $table.kategori, builder: (column) => column);

  Expression<T> projectDocumentsRefs<T extends Object>(
    Expression<T> Function($$ProjectDocumentsTableAnnotationComposer a) f,
  ) {
    final $$ProjectDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projectDocuments,
      getReferencedColumn: (t) => t.folderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.projectDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentFoldersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentFoldersTable,
          DocumentFolder,
          $$DocumentFoldersTableFilterComposer,
          $$DocumentFoldersTableOrderingComposer,
          $$DocumentFoldersTableAnnotationComposer,
          $$DocumentFoldersTableCreateCompanionBuilder,
          $$DocumentFoldersTableUpdateCompanionBuilder,
          (DocumentFolder, $$DocumentFoldersTableReferences),
          DocumentFolder,
          PrefetchHooks Function({bool projectDocumentsRefs})
        > {
  $$DocumentFoldersTableTableManager(
    _$AppDatabase db,
    $DocumentFoldersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentFoldersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentFoldersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentFoldersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> namaFolder = const Value.absent(),
                Value<String?> kategori = const Value.absent(),
              }) => DocumentFoldersCompanion(
                id: id,
                namaFolder: namaFolder,
                kategori: kategori,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaFolder,
                Value<String?> kategori = const Value.absent(),
              }) => DocumentFoldersCompanion.insert(
                id: id,
                namaFolder: namaFolder,
                kategori: kategori,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentFoldersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({projectDocumentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (projectDocumentsRefs) db.projectDocuments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (projectDocumentsRefs)
                    await $_getPrefetchedData<
                      DocumentFolder,
                      $DocumentFoldersTable,
                      ProjectDocument
                    >(
                      currentTable: table,
                      referencedTable: $$DocumentFoldersTableReferences
                          ._projectDocumentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DocumentFoldersTableReferences(
                            db,
                            table,
                            p0,
                          ).projectDocumentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.folderId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DocumentFoldersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentFoldersTable,
      DocumentFolder,
      $$DocumentFoldersTableFilterComposer,
      $$DocumentFoldersTableOrderingComposer,
      $$DocumentFoldersTableAnnotationComposer,
      $$DocumentFoldersTableCreateCompanionBuilder,
      $$DocumentFoldersTableUpdateCompanionBuilder,
      (DocumentFolder, $$DocumentFoldersTableReferences),
      DocumentFolder,
      PrefetchHooks Function({bool projectDocumentsRefs})
    >;
typedef $$ProjectDocumentsTableCreateCompanionBuilder =
    ProjectDocumentsCompanion Function({
      Value<int> id,
      required int proyekId,
      required int folderId,
      required String namaFile,
      required String fileUrl,
      required String diunggahOleh,
      required String tanggalUnggah,
    });
typedef $$ProjectDocumentsTableUpdateCompanionBuilder =
    ProjectDocumentsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<int> folderId,
      Value<String> namaFile,
      Value<String> fileUrl,
      Value<String> diunggahOleh,
      Value<String> tanggalUnggah,
    });

final class $$ProjectDocumentsTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProjectDocumentsTable, ProjectDocument> {
  $$ProjectDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProjectsTable _proyekIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
        $_aliasNameGenerator(db.projectDocuments.proyekId, db.projects.id),
      );

  $$ProjectsTableProcessedTableManager get proyekId {
    final $_column = $_itemColumn<int>('proyek_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_proyekIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DocumentFoldersTable _folderIdTable(_$AppDatabase db) =>
      db.documentFolders.createAlias(
        $_aliasNameGenerator(
          db.projectDocuments.folderId,
          db.documentFolders.id,
        ),
      );

  $$DocumentFoldersTableProcessedTableManager get folderId {
    final $_column = $_itemColumn<int>('folder_id')!;

    final manager = $$DocumentFoldersTableTableManager(
      $_db,
      $_db.documentFolders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_folderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _diunggahOlehTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(
          db.projectDocuments.diunggahOleh,
          db.users.firebaseUid,
        ),
      );

  $$UsersTableProcessedTableManager get diunggahOleh {
    final $_column = $_itemColumn<String>('diunggah_oleh')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_diunggahOlehTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProjectDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectDocumentsTable> {
  $$ProjectDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaFile => $composableBuilder(
    column: $table.namaFile,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggalUnggah => $composableBuilder(
    column: $table.tanggalUnggah,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get proyekId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentFoldersTableFilterComposer get folderId {
    final $$DocumentFoldersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.documentFolders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentFoldersTableFilterComposer(
            $db: $db,
            $table: $db.documentFolders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get diunggahOleh {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.diunggahOleh,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectDocumentsTable> {
  $$ProjectDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaFile => $composableBuilder(
    column: $table.namaFile,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggalUnggah => $composableBuilder(
    column: $table.tanggalUnggah,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get proyekId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentFoldersTableOrderingComposer get folderId {
    final $$DocumentFoldersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.documentFolders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentFoldersTableOrderingComposer(
            $db: $db,
            $table: $db.documentFolders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get diunggahOleh {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.diunggahOleh,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectDocumentsTable> {
  $$ProjectDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaFile =>
      $composableBuilder(column: $table.namaFile, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get tanggalUnggah => $composableBuilder(
    column: $table.tanggalUnggah,
    builder: (column) => column,
  );

  $$ProjectsTableAnnotationComposer get proyekId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DocumentFoldersTableAnnotationComposer get folderId {
    final $$DocumentFoldersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.folderId,
      referencedTable: $db.documentFolders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentFoldersTableAnnotationComposer(
            $db: $db,
            $table: $db.documentFolders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get diunggahOleh {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.diunggahOleh,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectDocumentsTable,
          ProjectDocument,
          $$ProjectDocumentsTableFilterComposer,
          $$ProjectDocumentsTableOrderingComposer,
          $$ProjectDocumentsTableAnnotationComposer,
          $$ProjectDocumentsTableCreateCompanionBuilder,
          $$ProjectDocumentsTableUpdateCompanionBuilder,
          (ProjectDocument, $$ProjectDocumentsTableReferences),
          ProjectDocument,
          PrefetchHooks Function({
            bool proyekId,
            bool folderId,
            bool diunggahOleh,
          })
        > {
  $$ProjectDocumentsTableTableManager(
    _$AppDatabase db,
    $ProjectDocumentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proyekId = const Value.absent(),
                Value<int> folderId = const Value.absent(),
                Value<String> namaFile = const Value.absent(),
                Value<String> fileUrl = const Value.absent(),
                Value<String> diunggahOleh = const Value.absent(),
                Value<String> tanggalUnggah = const Value.absent(),
              }) => ProjectDocumentsCompanion(
                id: id,
                proyekId: proyekId,
                folderId: folderId,
                namaFile: namaFile,
                fileUrl: fileUrl,
                diunggahOleh: diunggahOleh,
                tanggalUnggah: tanggalUnggah,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                required int folderId,
                required String namaFile,
                required String fileUrl,
                required String diunggahOleh,
                required String tanggalUnggah,
              }) => ProjectDocumentsCompanion.insert(
                id: id,
                proyekId: proyekId,
                folderId: folderId,
                namaFile: namaFile,
                fileUrl: fileUrl,
                diunggahOleh: diunggahOleh,
                tanggalUnggah: tanggalUnggah,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({proyekId = false, folderId = false, diunggahOleh = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (proyekId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.proyekId,
                                    referencedTable:
                                        $$ProjectDocumentsTableReferences
                                            ._proyekIdTable(db),
                                    referencedColumn:
                                        $$ProjectDocumentsTableReferences
                                            ._proyekIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (folderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.folderId,
                                    referencedTable:
                                        $$ProjectDocumentsTableReferences
                                            ._folderIdTable(db),
                                    referencedColumn:
                                        $$ProjectDocumentsTableReferences
                                            ._folderIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (diunggahOleh) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.diunggahOleh,
                                    referencedTable:
                                        $$ProjectDocumentsTableReferences
                                            ._diunggahOlehTable(db),
                                    referencedColumn:
                                        $$ProjectDocumentsTableReferences
                                            ._diunggahOlehTable(db)
                                            .firebaseUid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectDocumentsTable,
      ProjectDocument,
      $$ProjectDocumentsTableFilterComposer,
      $$ProjectDocumentsTableOrderingComposer,
      $$ProjectDocumentsTableAnnotationComposer,
      $$ProjectDocumentsTableCreateCompanionBuilder,
      $$ProjectDocumentsTableUpdateCompanionBuilder,
      (ProjectDocument, $$ProjectDocumentsTableReferences),
      ProjectDocument,
      PrefetchHooks Function({bool proyekId, bool folderId, bool diunggahOleh})
    >;
typedef $$ProjectLogsTableCreateCompanionBuilder =
    ProjectLogsCompanion Function({
      Value<int> id,
      required int proyekId,
      required String userId,
      required String aktivitas,
      required String waktu,
    });
typedef $$ProjectLogsTableUpdateCompanionBuilder =
    ProjectLogsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<String> userId,
      Value<String> aktivitas,
      Value<String> waktu,
    });

final class $$ProjectLogsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectLogsTable, ProjectLog> {
  $$ProjectLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _proyekIdTable(_$AppDatabase db) =>
      db.projects.createAlias(
        $_aliasNameGenerator(db.projectLogs.proyekId, db.projects.id),
      );

  $$ProjectsTableProcessedTableManager get proyekId {
    final $_column = $_itemColumn<int>('proyek_id')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_proyekIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.projectLogs.userId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProjectLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectLogsTable> {
  $$ProjectLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aktivitas => $composableBuilder(
    column: $table.aktivitas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waktu => $composableBuilder(
    column: $table.waktu,
    builder: (column) => ColumnFilters(column),
  );

  $$ProjectsTableFilterComposer get proyekId {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectLogsTable> {
  $$ProjectLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aktivitas => $composableBuilder(
    column: $table.aktivitas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waktu => $composableBuilder(
    column: $table.waktu,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProjectsTableOrderingComposer get proyekId {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectLogsTable> {
  $$ProjectLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get aktivitas =>
      $composableBuilder(column: $table.aktivitas, builder: (column) => column);

  GeneratedColumn<String> get waktu =>
      $composableBuilder(column: $table.waktu, builder: (column) => column);

  $$ProjectsTableAnnotationComposer get proyekId {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proyekId,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectLogsTable,
          ProjectLog,
          $$ProjectLogsTableFilterComposer,
          $$ProjectLogsTableOrderingComposer,
          $$ProjectLogsTableAnnotationComposer,
          $$ProjectLogsTableCreateCompanionBuilder,
          $$ProjectLogsTableUpdateCompanionBuilder,
          (ProjectLog, $$ProjectLogsTableReferences),
          ProjectLog,
          PrefetchHooks Function({bool proyekId, bool userId})
        > {
  $$ProjectLogsTableTableManager(_$AppDatabase db, $ProjectLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proyekId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> aktivitas = const Value.absent(),
                Value<String> waktu = const Value.absent(),
              }) => ProjectLogsCompanion(
                id: id,
                proyekId: proyekId,
                userId: userId,
                aktivitas: aktivitas,
                waktu: waktu,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                required String userId,
                required String aktivitas,
                required String waktu,
              }) => ProjectLogsCompanion.insert(
                id: id,
                proyekId: proyekId,
                userId: userId,
                aktivitas: aktivitas,
                waktu: waktu,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({proyekId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (proyekId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.proyekId,
                                referencedTable: $$ProjectLogsTableReferences
                                    ._proyekIdTable(db),
                                referencedColumn: $$ProjectLogsTableReferences
                                    ._proyekIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ProjectLogsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ProjectLogsTableReferences
                                    ._userIdTable(db)
                                    .firebaseUid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProjectLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectLogsTable,
      ProjectLog,
      $$ProjectLogsTableFilterComposer,
      $$ProjectLogsTableOrderingComposer,
      $$ProjectLogsTableAnnotationComposer,
      $$ProjectLogsTableCreateCompanionBuilder,
      $$ProjectLogsTableUpdateCompanionBuilder,
      (ProjectLog, $$ProjectLogsTableReferences),
      ProjectLog,
      PrefetchHooks Function({bool proyekId, bool userId})
    >;
typedef $$LoginHistoryTableCreateCompanionBuilder =
    LoginHistoryCompanion Function({
      Value<int> id,
      required String userId,
      required String perangkat,
      Value<String?> lokasi,
      required String waktuLogin,
    });
typedef $$LoginHistoryTableUpdateCompanionBuilder =
    LoginHistoryCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> perangkat,
      Value<String?> lokasi,
      Value<String> waktuLogin,
    });

final class $$LoginHistoryTableReferences
    extends
        BaseReferences<_$AppDatabase, $LoginHistoryTable, LoginHistoryData> {
  $$LoginHistoryTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.loginHistory.userId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoginHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $LoginHistoryTable> {
  $$LoginHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get perangkat => $composableBuilder(
    column: $table.perangkat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waktuLogin => $composableBuilder(
    column: $table.waktuLogin,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoginHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $LoginHistoryTable> {
  $$LoginHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get perangkat => $composableBuilder(
    column: $table.perangkat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waktuLogin => $composableBuilder(
    column: $table.waktuLogin,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoginHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoginHistoryTable> {
  $$LoginHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get perangkat =>
      $composableBuilder(column: $table.perangkat, builder: (column) => column);

  GeneratedColumn<String> get lokasi =>
      $composableBuilder(column: $table.lokasi, builder: (column) => column);

  GeneratedColumn<String> get waktuLogin => $composableBuilder(
    column: $table.waktuLogin,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.firebaseUid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoginHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LoginHistoryTable,
          LoginHistoryData,
          $$LoginHistoryTableFilterComposer,
          $$LoginHistoryTableOrderingComposer,
          $$LoginHistoryTableAnnotationComposer,
          $$LoginHistoryTableCreateCompanionBuilder,
          $$LoginHistoryTableUpdateCompanionBuilder,
          (LoginHistoryData, $$LoginHistoryTableReferences),
          LoginHistoryData,
          PrefetchHooks Function({bool userId})
        > {
  $$LoginHistoryTableTableManager(_$AppDatabase db, $LoginHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoginHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoginHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoginHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> perangkat = const Value.absent(),
                Value<String?> lokasi = const Value.absent(),
                Value<String> waktuLogin = const Value.absent(),
              }) => LoginHistoryCompanion(
                id: id,
                userId: userId,
                perangkat: perangkat,
                lokasi: lokasi,
                waktuLogin: waktuLogin,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String perangkat,
                Value<String?> lokasi = const Value.absent(),
                required String waktuLogin,
              }) => LoginHistoryCompanion.insert(
                id: id,
                userId: userId,
                perangkat: perangkat,
                lokasi: lokasi,
                waktuLogin: waktuLogin,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoginHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$LoginHistoryTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$LoginHistoryTableReferences
                                    ._userIdTable(db)
                                    .firebaseUid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoginHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LoginHistoryTable,
      LoginHistoryData,
      $$LoginHistoryTableFilterComposer,
      $$LoginHistoryTableOrderingComposer,
      $$LoginHistoryTableAnnotationComposer,
      $$LoginHistoryTableCreateCompanionBuilder,
      $$LoginHistoryTableUpdateCompanionBuilder,
      (LoginHistoryData, $$LoginHistoryTableReferences),
      LoginHistoryData,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PerusahaanTableTableManager get perusahaan =>
      $$PerusahaanTableTableManager(_db, _db.perusahaan);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$ReportMaterialsTableTableManager get reportMaterials =>
      $$ReportMaterialsTableTableManager(_db, _db.reportMaterials);
  $$ReportPhotosTableTableManager get reportPhotos =>
      $$ReportPhotosTableTableManager(_db, _db.reportPhotos);
  $$ProjectTeamsTableTableManager get projectTeams =>
      $$ProjectTeamsTableTableManager(_db, _db.projectTeams);
  $$DocumentFoldersTableTableManager get documentFolders =>
      $$DocumentFoldersTableTableManager(_db, _db.documentFolders);
  $$ProjectDocumentsTableTableManager get projectDocuments =>
      $$ProjectDocumentsTableTableManager(_db, _db.projectDocuments);
  $$ProjectLogsTableTableManager get projectLogs =>
      $$ProjectLogsTableTableManager(_db, _db.projectLogs);
  $$LoginHistoryTableTableManager get loginHistory =>
      $$LoginHistoryTableTableManager(_db, _db.loginHistory);
}
