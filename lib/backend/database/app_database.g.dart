// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
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
    email,
    peran,
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
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
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
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      peran: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}peran'],
      )!,
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
  final String? email;
  final String peran;
  final String? nomorHp;
  const User({
    required this.firebaseUid,
    required this.nama,
    this.email,
    required this.peran,
    this.nomorHp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firebase_uid'] = Variable<String>(firebaseUid);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['peran'] = Variable<String>(peran);
    if (!nullToAbsent || nomorHp != null) {
      map['nomor_hp'] = Variable<String>(nomorHp);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      firebaseUid: Value(firebaseUid),
      nama: Value(nama),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      peran: Value(peran),
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
      email: serializer.fromJson<String?>(json['email']),
      peran: serializer.fromJson<String>(json['peran']),
      nomorHp: serializer.fromJson<String?>(json['nomorHp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firebaseUid': serializer.toJson<String>(firebaseUid),
      'nama': serializer.toJson<String>(nama),
      'email': serializer.toJson<String?>(email),
      'peran': serializer.toJson<String>(peran),
      'nomorHp': serializer.toJson<String?>(nomorHp),
    };
  }

  User copyWith({
    String? firebaseUid,
    String? nama,
    Value<String?> email = const Value.absent(),
    String? peran,
    Value<String?> nomorHp = const Value.absent(),
  }) => User(
    firebaseUid: firebaseUid ?? this.firebaseUid,
    nama: nama ?? this.nama,
    email: email.present ? email.value : this.email,
    peran: peran ?? this.peran,
    nomorHp: nomorHp.present ? nomorHp.value : this.nomorHp,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      nama: data.nama.present ? data.nama.value : this.nama,
      email: data.email.present ? data.email.value : this.email,
      peran: data.peran.present ? data.peran.value : this.peran,
      nomorHp: data.nomorHp.present ? data.nomorHp.value : this.nomorHp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('nama: $nama, ')
          ..write('email: $email, ')
          ..write('peran: $peran, ')
          ..write('nomorHp: $nomorHp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(firebaseUid, nama, email, peran, nomorHp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.firebaseUid == this.firebaseUid &&
          other.nama == this.nama &&
          other.email == this.email &&
          other.peran == this.peran &&
          other.nomorHp == this.nomorHp);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> firebaseUid;
  final Value<String> nama;
  final Value<String?> email;
  final Value<String> peran;
  final Value<String?> nomorHp;
  final Value<int> rowid;
  const UsersCompanion({
    this.firebaseUid = const Value.absent(),
    this.nama = const Value.absent(),
    this.email = const Value.absent(),
    this.peran = const Value.absent(),
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String firebaseUid,
    required String nama,
    this.email = const Value.absent(),
    required String peran,
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : firebaseUid = Value(firebaseUid),
       nama = Value(nama),
       peran = Value(peran);
  static Insertable<User> custom({
    Expression<String>? firebaseUid,
    Expression<String>? nama,
    Expression<String>? email,
    Expression<String>? peran,
    Expression<String>? nomorHp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (nama != null) 'nama': nama,
      if (email != null) 'email': email,
      if (peran != null) 'peran': peran,
      if (nomorHp != null) 'nomor_hp': nomorHp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? firebaseUid,
    Value<String>? nama,
    Value<String?>? email,
    Value<String>? peran,
    Value<String?>? nomorHp,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      firebaseUid: firebaseUid ?? this.firebaseUid,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      peran: peran ?? this.peran,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (peran.present) {
      map['peran'] = Variable<String>(peran.value);
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
          ..write('email: $email, ')
          ..write('peran: $peran, ')
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
  static const VerificationMeta _tanggalSelesaiMeta = const VerificationMeta(
    'tanggalSelesai',
  );
  @override
  late final GeneratedColumn<String> tanggalSelesai = GeneratedColumn<String>(
    'tanggal_selesai',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nilaiKontrakMeta = const VerificationMeta(
    'nilaiKontrak',
  );
  @override
  late final GeneratedColumn<double> nilaiKontrak = GeneratedColumn<double>(
    'nilai_kontrak',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kontraktorIdMeta = const VerificationMeta(
    'kontraktorId',
  );
  @override
  late final GeneratedColumn<String> kontraktorId = GeneratedColumn<String>(
    'kontraktor_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _dinasIdMeta = const VerificationMeta(
    'dinasId',
  );
  @override
  late final GeneratedColumn<String> dinasId = GeneratedColumn<String>(
    'dinas_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
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
    kategori,
    tanggalMulai,
    tanggalSelesai,
    nilaiKontrak,
    kontraktorId,
    dinasId,
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
    if (data.containsKey('kategori')) {
      context.handle(
        _kategoriMeta,
        kategori.isAcceptableOrUnknown(data['kategori']!, _kategoriMeta),
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
    if (data.containsKey('tanggal_selesai')) {
      context.handle(
        _tanggalSelesaiMeta,
        tanggalSelesai.isAcceptableOrUnknown(
          data['tanggal_selesai']!,
          _tanggalSelesaiMeta,
        ),
      );
    }
    if (data.containsKey('nilai_kontrak')) {
      context.handle(
        _nilaiKontrakMeta,
        nilaiKontrak.isAcceptableOrUnknown(
          data['nilai_kontrak']!,
          _nilaiKontrakMeta,
        ),
      );
    }
    if (data.containsKey('kontraktor_id')) {
      context.handle(
        _kontraktorIdMeta,
        kontraktorId.isAcceptableOrUnknown(
          data['kontraktor_id']!,
          _kontraktorIdMeta,
        ),
      );
    }
    if (data.containsKey('dinas_id')) {
      context.handle(
        _dinasIdMeta,
        dinasId.isAcceptableOrUnknown(data['dinas_id']!, _dinasIdMeta),
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
      kategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kategori'],
      ),
      tanggalMulai: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal_mulai'],
      ),
      tanggalSelesai: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal_selesai'],
      ),
      nilaiKontrak: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nilai_kontrak'],
      ),
      kontraktorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kontraktor_id'],
      ),
      dinasId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dinas_id'],
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
  final String? kategori;
  final String? tanggalMulai;
  final String? tanggalSelesai;
  final double? nilaiKontrak;
  final String? kontraktorId;
  final String? dinasId;
  final String status;
  const Project({
    required this.id,
    required this.namaProyek,
    this.lokasi,
    this.kategori,
    this.tanggalMulai,
    this.tanggalSelesai,
    this.nilaiKontrak,
    this.kontraktorId,
    this.dinasId,
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
    if (!nullToAbsent || kategori != null) {
      map['kategori'] = Variable<String>(kategori);
    }
    if (!nullToAbsent || tanggalMulai != null) {
      map['tanggal_mulai'] = Variable<String>(tanggalMulai);
    }
    if (!nullToAbsent || tanggalSelesai != null) {
      map['tanggal_selesai'] = Variable<String>(tanggalSelesai);
    }
    if (!nullToAbsent || nilaiKontrak != null) {
      map['nilai_kontrak'] = Variable<double>(nilaiKontrak);
    }
    if (!nullToAbsent || kontraktorId != null) {
      map['kontraktor_id'] = Variable<String>(kontraktorId);
    }
    if (!nullToAbsent || dinasId != null) {
      map['dinas_id'] = Variable<String>(dinasId);
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
      kategori: kategori == null && nullToAbsent
          ? const Value.absent()
          : Value(kategori),
      tanggalMulai: tanggalMulai == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalMulai),
      tanggalSelesai: tanggalSelesai == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalSelesai),
      nilaiKontrak: nilaiKontrak == null && nullToAbsent
          ? const Value.absent()
          : Value(nilaiKontrak),
      kontraktorId: kontraktorId == null && nullToAbsent
          ? const Value.absent()
          : Value(kontraktorId),
      dinasId: dinasId == null && nullToAbsent
          ? const Value.absent()
          : Value(dinasId),
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
      kategori: serializer.fromJson<String?>(json['kategori']),
      tanggalMulai: serializer.fromJson<String?>(json['tanggalMulai']),
      tanggalSelesai: serializer.fromJson<String?>(json['tanggalSelesai']),
      nilaiKontrak: serializer.fromJson<double?>(json['nilaiKontrak']),
      kontraktorId: serializer.fromJson<String?>(json['kontraktorId']),
      dinasId: serializer.fromJson<String?>(json['dinasId']),
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
      'kategori': serializer.toJson<String?>(kategori),
      'tanggalMulai': serializer.toJson<String?>(tanggalMulai),
      'tanggalSelesai': serializer.toJson<String?>(tanggalSelesai),
      'nilaiKontrak': serializer.toJson<double?>(nilaiKontrak),
      'kontraktorId': serializer.toJson<String?>(kontraktorId),
      'dinasId': serializer.toJson<String?>(dinasId),
      'status': serializer.toJson<String>(status),
    };
  }

  Project copyWith({
    int? id,
    String? namaProyek,
    Value<String?> lokasi = const Value.absent(),
    Value<String?> kategori = const Value.absent(),
    Value<String?> tanggalMulai = const Value.absent(),
    Value<String?> tanggalSelesai = const Value.absent(),
    Value<double?> nilaiKontrak = const Value.absent(),
    Value<String?> kontraktorId = const Value.absent(),
    Value<String?> dinasId = const Value.absent(),
    String? status,
  }) => Project(
    id: id ?? this.id,
    namaProyek: namaProyek ?? this.namaProyek,
    lokasi: lokasi.present ? lokasi.value : this.lokasi,
    kategori: kategori.present ? kategori.value : this.kategori,
    tanggalMulai: tanggalMulai.present ? tanggalMulai.value : this.tanggalMulai,
    tanggalSelesai: tanggalSelesai.present
        ? tanggalSelesai.value
        : this.tanggalSelesai,
    nilaiKontrak: nilaiKontrak.present ? nilaiKontrak.value : this.nilaiKontrak,
    kontraktorId: kontraktorId.present ? kontraktorId.value : this.kontraktorId,
    dinasId: dinasId.present ? dinasId.value : this.dinasId,
    status: status ?? this.status,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      id: data.id.present ? data.id.value : this.id,
      namaProyek: data.namaProyek.present
          ? data.namaProyek.value
          : this.namaProyek,
      lokasi: data.lokasi.present ? data.lokasi.value : this.lokasi,
      kategori: data.kategori.present ? data.kategori.value : this.kategori,
      tanggalMulai: data.tanggalMulai.present
          ? data.tanggalMulai.value
          : this.tanggalMulai,
      tanggalSelesai: data.tanggalSelesai.present
          ? data.tanggalSelesai.value
          : this.tanggalSelesai,
      nilaiKontrak: data.nilaiKontrak.present
          ? data.nilaiKontrak.value
          : this.nilaiKontrak,
      kontraktorId: data.kontraktorId.present
          ? data.kontraktorId.value
          : this.kontraktorId,
      dinasId: data.dinasId.present ? data.dinasId.value : this.dinasId,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('namaProyek: $namaProyek, ')
          ..write('lokasi: $lokasi, ')
          ..write('kategori: $kategori, ')
          ..write('tanggalMulai: $tanggalMulai, ')
          ..write('tanggalSelesai: $tanggalSelesai, ')
          ..write('nilaiKontrak: $nilaiKontrak, ')
          ..write('kontraktorId: $kontraktorId, ')
          ..write('dinasId: $dinasId, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    namaProyek,
    lokasi,
    kategori,
    tanggalMulai,
    tanggalSelesai,
    nilaiKontrak,
    kontraktorId,
    dinasId,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.namaProyek == this.namaProyek &&
          other.lokasi == this.lokasi &&
          other.kategori == this.kategori &&
          other.tanggalMulai == this.tanggalMulai &&
          other.tanggalSelesai == this.tanggalSelesai &&
          other.nilaiKontrak == this.nilaiKontrak &&
          other.kontraktorId == this.kontraktorId &&
          other.dinasId == this.dinasId &&
          other.status == this.status);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> namaProyek;
  final Value<String?> lokasi;
  final Value<String?> kategori;
  final Value<String?> tanggalMulai;
  final Value<String?> tanggalSelesai;
  final Value<double?> nilaiKontrak;
  final Value<String?> kontraktorId;
  final Value<String?> dinasId;
  final Value<String> status;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.namaProyek = const Value.absent(),
    this.lokasi = const Value.absent(),
    this.kategori = const Value.absent(),
    this.tanggalMulai = const Value.absent(),
    this.tanggalSelesai = const Value.absent(),
    this.nilaiKontrak = const Value.absent(),
    this.kontraktorId = const Value.absent(),
    this.dinasId = const Value.absent(),
    this.status = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String namaProyek,
    this.lokasi = const Value.absent(),
    this.kategori = const Value.absent(),
    this.tanggalMulai = const Value.absent(),
    this.tanggalSelesai = const Value.absent(),
    this.nilaiKontrak = const Value.absent(),
    this.kontraktorId = const Value.absent(),
    this.dinasId = const Value.absent(),
    this.status = const Value.absent(),
  }) : namaProyek = Value(namaProyek);
  static Insertable<Project> custom({
    Expression<int>? id,
    Expression<String>? namaProyek,
    Expression<String>? lokasi,
    Expression<String>? kategori,
    Expression<String>? tanggalMulai,
    Expression<String>? tanggalSelesai,
    Expression<double>? nilaiKontrak,
    Expression<String>? kontraktorId,
    Expression<String>? dinasId,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaProyek != null) 'nama_proyek': namaProyek,
      if (lokasi != null) 'lokasi': lokasi,
      if (kategori != null) 'kategori': kategori,
      if (tanggalMulai != null) 'tanggal_mulai': tanggalMulai,
      if (tanggalSelesai != null) 'tanggal_selesai': tanggalSelesai,
      if (nilaiKontrak != null) 'nilai_kontrak': nilaiKontrak,
      if (kontraktorId != null) 'kontraktor_id': kontraktorId,
      if (dinasId != null) 'dinas_id': dinasId,
      if (status != null) 'status': status,
    });
  }

  ProjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? namaProyek,
    Value<String?>? lokasi,
    Value<String?>? kategori,
    Value<String?>? tanggalMulai,
    Value<String?>? tanggalSelesai,
    Value<double?>? nilaiKontrak,
    Value<String?>? kontraktorId,
    Value<String?>? dinasId,
    Value<String>? status,
  }) {
    return ProjectsCompanion(
      id: id ?? this.id,
      namaProyek: namaProyek ?? this.namaProyek,
      lokasi: lokasi ?? this.lokasi,
      kategori: kategori ?? this.kategori,
      tanggalMulai: tanggalMulai ?? this.tanggalMulai,
      tanggalSelesai: tanggalSelesai ?? this.tanggalSelesai,
      nilaiKontrak: nilaiKontrak ?? this.nilaiKontrak,
      kontraktorId: kontraktorId ?? this.kontraktorId,
      dinasId: dinasId ?? this.dinasId,
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
    if (kategori.present) {
      map['kategori'] = Variable<String>(kategori.value);
    }
    if (tanggalMulai.present) {
      map['tanggal_mulai'] = Variable<String>(tanggalMulai.value);
    }
    if (tanggalSelesai.present) {
      map['tanggal_selesai'] = Variable<String>(tanggalSelesai.value);
    }
    if (nilaiKontrak.present) {
      map['nilai_kontrak'] = Variable<double>(nilaiKontrak.value);
    }
    if (kontraktorId.present) {
      map['kontraktor_id'] = Variable<String>(kontraktorId.value);
    }
    if (dinasId.present) {
      map['dinas_id'] = Variable<String>(dinasId.value);
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
          ..write('kategori: $kategori, ')
          ..write('tanggalMulai: $tanggalMulai, ')
          ..write('tanggalSelesai: $tanggalSelesai, ')
          ..write('nilaiKontrak: $nilaiKontrak, ')
          ..write('kontraktorId: $kontraktorId, ')
          ..write('dinasId: $dinasId, ')
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
  static const VerificationMeta _pembuatIdMeta = const VerificationMeta(
    'pembuatId',
  );
  @override
  late final GeneratedColumn<String> pembuatId = GeneratedColumn<String>(
    'pembuat_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tipeLaporanMeta = const VerificationMeta(
    'tipeLaporan',
  );
  @override
  late final GeneratedColumn<String> tipeLaporan = GeneratedColumn<String>(
    'tipe_laporan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('volume_kontraktor'),
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
  static const VerificationMeta _geotagLokasiMeta = const VerificationMeta(
    'geotagLokasi',
  );
  @override
  late final GeneratedColumn<String> geotagLokasi = GeneratedColumn<String>(
    'geotag_lokasi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fotoSelfieUrlMeta = const VerificationMeta(
    'fotoSelfieUrl',
  );
  @override
  late final GeneratedColumn<String> fotoSelfieUrl = GeneratedColumn<String>(
    'foto_selfie_url',
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
  static const VerificationMeta _catatanRevisiMeta = const VerificationMeta(
    'catatanRevisi',
  );
  @override
  late final GeneratedColumn<String> catatanRevisi = GeneratedColumn<String>(
    'catatan_revisi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proyekId,
    pembuatId,
    tipeLaporan,
    tanggal,
    deskripsi,
    fotoUrl,
    geotagLokasi,
    fotoSelfieUrl,
    progress,
    status,
    catatanRevisi,
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
    if (data.containsKey('pembuat_id')) {
      context.handle(
        _pembuatIdMeta,
        pembuatId.isAcceptableOrUnknown(data['pembuat_id']!, _pembuatIdMeta),
      );
    }
    if (data.containsKey('tipe_laporan')) {
      context.handle(
        _tipeLaporanMeta,
        tipeLaporan.isAcceptableOrUnknown(
          data['tipe_laporan']!,
          _tipeLaporanMeta,
        ),
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
    if (data.containsKey('geotag_lokasi')) {
      context.handle(
        _geotagLokasiMeta,
        geotagLokasi.isAcceptableOrUnknown(
          data['geotag_lokasi']!,
          _geotagLokasiMeta,
        ),
      );
    }
    if (data.containsKey('foto_selfie_url')) {
      context.handle(
        _fotoSelfieUrlMeta,
        fotoSelfieUrl.isAcceptableOrUnknown(
          data['foto_selfie_url']!,
          _fotoSelfieUrlMeta,
        ),
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
    if (data.containsKey('catatan_revisi')) {
      context.handle(
        _catatanRevisiMeta,
        catatanRevisi.isAcceptableOrUnknown(
          data['catatan_revisi']!,
          _catatanRevisiMeta,
        ),
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
      pembuatId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pembuat_id'],
      ),
      tipeLaporan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipe_laporan'],
      )!,
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
      geotagLokasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geotag_lokasi'],
      ),
      fotoSelfieUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto_selfie_url'],
      ),
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      catatanRevisi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catatan_revisi'],
      ),
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
  final String? pembuatId;
  final String tipeLaporan;
  final String tanggal;
  final String? deskripsi;
  final String? fotoUrl;
  final String? geotagLokasi;
  final String? fotoSelfieUrl;
  final int progress;
  final String status;
  final String? catatanRevisi;
  const Report({
    required this.id,
    required this.proyekId,
    this.pembuatId,
    required this.tipeLaporan,
    required this.tanggal,
    this.deskripsi,
    this.fotoUrl,
    this.geotagLokasi,
    this.fotoSelfieUrl,
    required this.progress,
    required this.status,
    this.catatanRevisi,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    if (!nullToAbsent || pembuatId != null) {
      map['pembuat_id'] = Variable<String>(pembuatId);
    }
    map['tipe_laporan'] = Variable<String>(tipeLaporan);
    map['tanggal'] = Variable<String>(tanggal);
    if (!nullToAbsent || deskripsi != null) {
      map['deskripsi'] = Variable<String>(deskripsi);
    }
    if (!nullToAbsent || fotoUrl != null) {
      map['foto_url'] = Variable<String>(fotoUrl);
    }
    if (!nullToAbsent || geotagLokasi != null) {
      map['geotag_lokasi'] = Variable<String>(geotagLokasi);
    }
    if (!nullToAbsent || fotoSelfieUrl != null) {
      map['foto_selfie_url'] = Variable<String>(fotoSelfieUrl);
    }
    map['progress'] = Variable<int>(progress);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || catatanRevisi != null) {
      map['catatan_revisi'] = Variable<String>(catatanRevisi);
    }
    return map;
  }

  ReportsCompanion toCompanion(bool nullToAbsent) {
    return ReportsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      pembuatId: pembuatId == null && nullToAbsent
          ? const Value.absent()
          : Value(pembuatId),
      tipeLaporan: Value(tipeLaporan),
      tanggal: Value(tanggal),
      deskripsi: deskripsi == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsi),
      fotoUrl: fotoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoUrl),
      geotagLokasi: geotagLokasi == null && nullToAbsent
          ? const Value.absent()
          : Value(geotagLokasi),
      fotoSelfieUrl: fotoSelfieUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fotoSelfieUrl),
      progress: Value(progress),
      status: Value(status),
      catatanRevisi: catatanRevisi == null && nullToAbsent
          ? const Value.absent()
          : Value(catatanRevisi),
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
      pembuatId: serializer.fromJson<String?>(json['pembuatId']),
      tipeLaporan: serializer.fromJson<String>(json['tipeLaporan']),
      tanggal: serializer.fromJson<String>(json['tanggal']),
      deskripsi: serializer.fromJson<String?>(json['deskripsi']),
      fotoUrl: serializer.fromJson<String?>(json['fotoUrl']),
      geotagLokasi: serializer.fromJson<String?>(json['geotagLokasi']),
      fotoSelfieUrl: serializer.fromJson<String?>(json['fotoSelfieUrl']),
      progress: serializer.fromJson<int>(json['progress']),
      status: serializer.fromJson<String>(json['status']),
      catatanRevisi: serializer.fromJson<String?>(json['catatanRevisi']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'pembuatId': serializer.toJson<String?>(pembuatId),
      'tipeLaporan': serializer.toJson<String>(tipeLaporan),
      'tanggal': serializer.toJson<String>(tanggal),
      'deskripsi': serializer.toJson<String?>(deskripsi),
      'fotoUrl': serializer.toJson<String?>(fotoUrl),
      'geotagLokasi': serializer.toJson<String?>(geotagLokasi),
      'fotoSelfieUrl': serializer.toJson<String?>(fotoSelfieUrl),
      'progress': serializer.toJson<int>(progress),
      'status': serializer.toJson<String>(status),
      'catatanRevisi': serializer.toJson<String?>(catatanRevisi),
    };
  }

  Report copyWith({
    int? id,
    int? proyekId,
    Value<String?> pembuatId = const Value.absent(),
    String? tipeLaporan,
    String? tanggal,
    Value<String?> deskripsi = const Value.absent(),
    Value<String?> fotoUrl = const Value.absent(),
    Value<String?> geotagLokasi = const Value.absent(),
    Value<String?> fotoSelfieUrl = const Value.absent(),
    int? progress,
    String? status,
    Value<String?> catatanRevisi = const Value.absent(),
  }) => Report(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    pembuatId: pembuatId.present ? pembuatId.value : this.pembuatId,
    tipeLaporan: tipeLaporan ?? this.tipeLaporan,
    tanggal: tanggal ?? this.tanggal,
    deskripsi: deskripsi.present ? deskripsi.value : this.deskripsi,
    fotoUrl: fotoUrl.present ? fotoUrl.value : this.fotoUrl,
    geotagLokasi: geotagLokasi.present ? geotagLokasi.value : this.geotagLokasi,
    fotoSelfieUrl: fotoSelfieUrl.present
        ? fotoSelfieUrl.value
        : this.fotoSelfieUrl,
    progress: progress ?? this.progress,
    status: status ?? this.status,
    catatanRevisi: catatanRevisi.present
        ? catatanRevisi.value
        : this.catatanRevisi,
  );
  Report copyWithCompanion(ReportsCompanion data) {
    return Report(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      pembuatId: data.pembuatId.present ? data.pembuatId.value : this.pembuatId,
      tipeLaporan: data.tipeLaporan.present
          ? data.tipeLaporan.value
          : this.tipeLaporan,
      tanggal: data.tanggal.present ? data.tanggal.value : this.tanggal,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      fotoUrl: data.fotoUrl.present ? data.fotoUrl.value : this.fotoUrl,
      geotagLokasi: data.geotagLokasi.present
          ? data.geotagLokasi.value
          : this.geotagLokasi,
      fotoSelfieUrl: data.fotoSelfieUrl.present
          ? data.fotoSelfieUrl.value
          : this.fotoSelfieUrl,
      progress: data.progress.present ? data.progress.value : this.progress,
      status: data.status.present ? data.status.value : this.status,
      catatanRevisi: data.catatanRevisi.present
          ? data.catatanRevisi.value
          : this.catatanRevisi,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Report(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('pembuatId: $pembuatId, ')
          ..write('tipeLaporan: $tipeLaporan, ')
          ..write('tanggal: $tanggal, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoUrl: $fotoUrl, ')
          ..write('geotagLokasi: $geotagLokasi, ')
          ..write('fotoSelfieUrl: $fotoSelfieUrl, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('catatanRevisi: $catatanRevisi')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    proyekId,
    pembuatId,
    tipeLaporan,
    tanggal,
    deskripsi,
    fotoUrl,
    geotagLokasi,
    fotoSelfieUrl,
    progress,
    status,
    catatanRevisi,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Report &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.pembuatId == this.pembuatId &&
          other.tipeLaporan == this.tipeLaporan &&
          other.tanggal == this.tanggal &&
          other.deskripsi == this.deskripsi &&
          other.fotoUrl == this.fotoUrl &&
          other.geotagLokasi == this.geotagLokasi &&
          other.fotoSelfieUrl == this.fotoSelfieUrl &&
          other.progress == this.progress &&
          other.status == this.status &&
          other.catatanRevisi == this.catatanRevisi);
}

class ReportsCompanion extends UpdateCompanion<Report> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<String?> pembuatId;
  final Value<String> tipeLaporan;
  final Value<String> tanggal;
  final Value<String?> deskripsi;
  final Value<String?> fotoUrl;
  final Value<String?> geotagLokasi;
  final Value<String?> fotoSelfieUrl;
  final Value<int> progress;
  final Value<String> status;
  final Value<String?> catatanRevisi;
  const ReportsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.pembuatId = const Value.absent(),
    this.tipeLaporan = const Value.absent(),
    this.tanggal = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.fotoUrl = const Value.absent(),
    this.geotagLokasi = const Value.absent(),
    this.fotoSelfieUrl = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
    this.catatanRevisi = const Value.absent(),
  });
  ReportsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    this.pembuatId = const Value.absent(),
    this.tipeLaporan = const Value.absent(),
    required String tanggal,
    this.deskripsi = const Value.absent(),
    this.fotoUrl = const Value.absent(),
    this.geotagLokasi = const Value.absent(),
    this.fotoSelfieUrl = const Value.absent(),
    this.progress = const Value.absent(),
    this.status = const Value.absent(),
    this.catatanRevisi = const Value.absent(),
  }) : proyekId = Value(proyekId),
       tanggal = Value(tanggal);
  static Insertable<Report> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<String>? pembuatId,
    Expression<String>? tipeLaporan,
    Expression<String>? tanggal,
    Expression<String>? deskripsi,
    Expression<String>? fotoUrl,
    Expression<String>? geotagLokasi,
    Expression<String>? fotoSelfieUrl,
    Expression<int>? progress,
    Expression<String>? status,
    Expression<String>? catatanRevisi,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (pembuatId != null) 'pembuat_id': pembuatId,
      if (tipeLaporan != null) 'tipe_laporan': tipeLaporan,
      if (tanggal != null) 'tanggal': tanggal,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (fotoUrl != null) 'foto_url': fotoUrl,
      if (geotagLokasi != null) 'geotag_lokasi': geotagLokasi,
      if (fotoSelfieUrl != null) 'foto_selfie_url': fotoSelfieUrl,
      if (progress != null) 'progress': progress,
      if (status != null) 'status': status,
      if (catatanRevisi != null) 'catatan_revisi': catatanRevisi,
    });
  }

  ReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<String?>? pembuatId,
    Value<String>? tipeLaporan,
    Value<String>? tanggal,
    Value<String?>? deskripsi,
    Value<String?>? fotoUrl,
    Value<String?>? geotagLokasi,
    Value<String?>? fotoSelfieUrl,
    Value<int>? progress,
    Value<String>? status,
    Value<String?>? catatanRevisi,
  }) {
    return ReportsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      pembuatId: pembuatId ?? this.pembuatId,
      tipeLaporan: tipeLaporan ?? this.tipeLaporan,
      tanggal: tanggal ?? this.tanggal,
      deskripsi: deskripsi ?? this.deskripsi,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      geotagLokasi: geotagLokasi ?? this.geotagLokasi,
      fotoSelfieUrl: fotoSelfieUrl ?? this.fotoSelfieUrl,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      catatanRevisi: catatanRevisi ?? this.catatanRevisi,
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
    if (pembuatId.present) {
      map['pembuat_id'] = Variable<String>(pembuatId.value);
    }
    if (tipeLaporan.present) {
      map['tipe_laporan'] = Variable<String>(tipeLaporan.value);
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
    if (geotagLokasi.present) {
      map['geotag_lokasi'] = Variable<String>(geotagLokasi.value);
    }
    if (fotoSelfieUrl.present) {
      map['foto_selfie_url'] = Variable<String>(fotoSelfieUrl.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (catatanRevisi.present) {
      map['catatan_revisi'] = Variable<String>(catatanRevisi.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('pembuatId: $pembuatId, ')
          ..write('tipeLaporan: $tipeLaporan, ')
          ..write('tanggal: $tanggal, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('fotoUrl: $fotoUrl, ')
          ..write('geotagLokasi: $geotagLokasi, ')
          ..write('fotoSelfieUrl: $fotoSelfieUrl, ')
          ..write('progress: $progress, ')
          ..write('status: $status, ')
          ..write('catatanRevisi: $catatanRevisi')
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
  static const VerificationMeta _volumeTargetMeta = const VerificationMeta(
    'volumeTarget',
  );
  @override
  late final GeneratedColumn<double> volumeTarget = GeneratedColumn<double>(
    'volume_target',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volumeRealisasiMeta = const VerificationMeta(
    'volumeRealisasi',
  );
  @override
  late final GeneratedColumn<double> volumeRealisasi = GeneratedColumn<double>(
    'volume_realisasi',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _satuanMeta = const VerificationMeta('satuan');
  @override
  late final GeneratedColumn<String> satuan = GeneratedColumn<String>(
    'satuan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    volumeTarget,
    volumeRealisasi,
    satuan,
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
    if (data.containsKey('volume_target')) {
      context.handle(
        _volumeTargetMeta,
        volumeTarget.isAcceptableOrUnknown(
          data['volume_target']!,
          _volumeTargetMeta,
        ),
      );
    }
    if (data.containsKey('volume_realisasi')) {
      context.handle(
        _volumeRealisasiMeta,
        volumeRealisasi.isAcceptableOrUnknown(
          data['volume_realisasi']!,
          _volumeRealisasiMeta,
        ),
      );
    }
    if (data.containsKey('satuan')) {
      context.handle(
        _satuanMeta,
        satuan.isAcceptableOrUnknown(data['satuan']!, _satuanMeta),
      );
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
      volumeTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume_target'],
      ),
      volumeRealisasi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume_realisasi'],
      ),
      satuan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}satuan'],
      ),
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
  final double? volumeTarget;
  final double? volumeRealisasi;
  final String? satuan;
  final bool isSelesai;
  const Task({
    required this.id,
    required this.reportId,
    required this.namaPekerjaan,
    this.volumeTarget,
    this.volumeRealisasi,
    this.satuan,
    required this.isSelesai,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['report_id'] = Variable<int>(reportId);
    map['nama_pekerjaan'] = Variable<String>(namaPekerjaan);
    if (!nullToAbsent || volumeTarget != null) {
      map['volume_target'] = Variable<double>(volumeTarget);
    }
    if (!nullToAbsent || volumeRealisasi != null) {
      map['volume_realisasi'] = Variable<double>(volumeRealisasi);
    }
    if (!nullToAbsent || satuan != null) {
      map['satuan'] = Variable<String>(satuan);
    }
    map['is_selesai'] = Variable<bool>(isSelesai);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      reportId: Value(reportId),
      namaPekerjaan: Value(namaPekerjaan),
      volumeTarget: volumeTarget == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeTarget),
      volumeRealisasi: volumeRealisasi == null && nullToAbsent
          ? const Value.absent()
          : Value(volumeRealisasi),
      satuan: satuan == null && nullToAbsent
          ? const Value.absent()
          : Value(satuan),
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
      volumeTarget: serializer.fromJson<double?>(json['volumeTarget']),
      volumeRealisasi: serializer.fromJson<double?>(json['volumeRealisasi']),
      satuan: serializer.fromJson<String?>(json['satuan']),
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
      'volumeTarget': serializer.toJson<double?>(volumeTarget),
      'volumeRealisasi': serializer.toJson<double?>(volumeRealisasi),
      'satuan': serializer.toJson<String?>(satuan),
      'isSelesai': serializer.toJson<bool>(isSelesai),
    };
  }

  Task copyWith({
    int? id,
    int? reportId,
    String? namaPekerjaan,
    Value<double?> volumeTarget = const Value.absent(),
    Value<double?> volumeRealisasi = const Value.absent(),
    Value<String?> satuan = const Value.absent(),
    bool? isSelesai,
  }) => Task(
    id: id ?? this.id,
    reportId: reportId ?? this.reportId,
    namaPekerjaan: namaPekerjaan ?? this.namaPekerjaan,
    volumeTarget: volumeTarget.present ? volumeTarget.value : this.volumeTarget,
    volumeRealisasi: volumeRealisasi.present
        ? volumeRealisasi.value
        : this.volumeRealisasi,
    satuan: satuan.present ? satuan.value : this.satuan,
    isSelesai: isSelesai ?? this.isSelesai,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      namaPekerjaan: data.namaPekerjaan.present
          ? data.namaPekerjaan.value
          : this.namaPekerjaan,
      volumeTarget: data.volumeTarget.present
          ? data.volumeTarget.value
          : this.volumeTarget,
      volumeRealisasi: data.volumeRealisasi.present
          ? data.volumeRealisasi.value
          : this.volumeRealisasi,
      satuan: data.satuan.present ? data.satuan.value : this.satuan,
      isSelesai: data.isSelesai.present ? data.isSelesai.value : this.isSelesai,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('namaPekerjaan: $namaPekerjaan, ')
          ..write('volumeTarget: $volumeTarget, ')
          ..write('volumeRealisasi: $volumeRealisasi, ')
          ..write('satuan: $satuan, ')
          ..write('isSelesai: $isSelesai')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    reportId,
    namaPekerjaan,
    volumeTarget,
    volumeRealisasi,
    satuan,
    isSelesai,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.namaPekerjaan == this.namaPekerjaan &&
          other.volumeTarget == this.volumeTarget &&
          other.volumeRealisasi == this.volumeRealisasi &&
          other.satuan == this.satuan &&
          other.isSelesai == this.isSelesai);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<int> reportId;
  final Value<String> namaPekerjaan;
  final Value<double?> volumeTarget;
  final Value<double?> volumeRealisasi;
  final Value<String?> satuan;
  final Value<bool> isSelesai;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.namaPekerjaan = const Value.absent(),
    this.volumeTarget = const Value.absent(),
    this.volumeRealisasi = const Value.absent(),
    this.satuan = const Value.absent(),
    this.isSelesai = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required int reportId,
    required String namaPekerjaan,
    this.volumeTarget = const Value.absent(),
    this.volumeRealisasi = const Value.absent(),
    this.satuan = const Value.absent(),
    this.isSelesai = const Value.absent(),
  }) : reportId = Value(reportId),
       namaPekerjaan = Value(namaPekerjaan);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<int>? reportId,
    Expression<String>? namaPekerjaan,
    Expression<double>? volumeTarget,
    Expression<double>? volumeRealisasi,
    Expression<String>? satuan,
    Expression<bool>? isSelesai,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (namaPekerjaan != null) 'nama_pekerjaan': namaPekerjaan,
      if (volumeTarget != null) 'volume_target': volumeTarget,
      if (volumeRealisasi != null) 'volume_realisasi': volumeRealisasi,
      if (satuan != null) 'satuan': satuan,
      if (isSelesai != null) 'is_selesai': isSelesai,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<int>? reportId,
    Value<String>? namaPekerjaan,
    Value<double?>? volumeTarget,
    Value<double?>? volumeRealisasi,
    Value<String?>? satuan,
    Value<bool>? isSelesai,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      namaPekerjaan: namaPekerjaan ?? this.namaPekerjaan,
      volumeTarget: volumeTarget ?? this.volumeTarget,
      volumeRealisasi: volumeRealisasi ?? this.volumeRealisasi,
      satuan: satuan ?? this.satuan,
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
    if (volumeTarget.present) {
      map['volume_target'] = Variable<double>(volumeTarget.value);
    }
    if (volumeRealisasi.present) {
      map['volume_realisasi'] = Variable<double>(volumeRealisasi.value);
    }
    if (satuan.present) {
      map['satuan'] = Variable<String>(satuan.value);
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
          ..write('volumeTarget: $volumeTarget, ')
          ..write('volumeRealisasi: $volumeRealisasi, ')
          ..write('satuan: $satuan, ')
          ..write('isSelesai: $isSelesai')
          ..write(')'))
        .toString();
  }
}

class $ActivityHistoriesTable extends ActivityHistories
    with TableInfo<$ActivityHistoriesTable, ActivityHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityHistoriesTable(this.attachedDatabase, [this._alias]);
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<String> timestamp = GeneratedColumn<String>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    action,
    entityType,
    entityId,
    description,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityHistory> instance, {
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
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityHistory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $ActivityHistoriesTable createAlias(String alias) {
    return $ActivityHistoriesTable(attachedDatabase, alias);
  }
}

class ActivityHistory extends DataClass implements Insertable<ActivityHistory> {
  final int id;
  final String? userId;
  final String action;
  final String entityType;
  final String entityId;
  final String description;
  final String timestamp;
  const ActivityHistory({
    required this.id,
    this.userId,
    required this.action,
    required this.entityType,
    required this.entityId,
    required this.description,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['action'] = Variable<String>(action);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['description'] = Variable<String>(description);
    map['timestamp'] = Variable<String>(timestamp);
    return map;
  }

  ActivityHistoriesCompanion toCompanion(bool nullToAbsent) {
    return ActivityHistoriesCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      action: Value(action),
      entityType: Value(entityType),
      entityId: Value(entityId),
      description: Value(description),
      timestamp: Value(timestamp),
    );
  }

  factory ActivityHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityHistory(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      action: serializer.fromJson<String>(json['action']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      description: serializer.fromJson<String>(json['description']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String?>(userId),
      'action': serializer.toJson<String>(action),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'description': serializer.toJson<String>(description),
      'timestamp': serializer.toJson<String>(timestamp),
    };
  }

  ActivityHistory copyWith({
    int? id,
    Value<String?> userId = const Value.absent(),
    String? action,
    String? entityType,
    String? entityId,
    String? description,
    String? timestamp,
  }) => ActivityHistory(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    action: action ?? this.action,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    description: description ?? this.description,
    timestamp: timestamp ?? this.timestamp,
  );
  ActivityHistory copyWithCompanion(ActivityHistoriesCompanion data) {
    return ActivityHistory(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      action: data.action.present ? data.action.value : this.action,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      description: data.description.present
          ? data.description.value
          : this.description,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityHistory(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    action,
    entityType,
    entityId,
    description,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityHistory &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.action == this.action &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.description == this.description &&
          other.timestamp == this.timestamp);
}

class ActivityHistoriesCompanion extends UpdateCompanion<ActivityHistory> {
  final Value<int> id;
  final Value<String?> userId;
  final Value<String> action;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> description;
  final Value<String> timestamp;
  const ActivityHistoriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.action = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ActivityHistoriesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String action,
    required String entityType,
    required String entityId,
    required String description,
    required String timestamp,
  }) : action = Value(action),
       entityType = Value(entityType),
       entityId = Value(entityId),
       description = Value(description),
       timestamp = Value(timestamp);
  static Insertable<ActivityHistory> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? action,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? description,
    Expression<String>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (action != null) 'action': action,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ActivityHistoriesCompanion copyWith({
    Value<int>? id,
    Value<String?>? userId,
    Value<String>? action,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? description,
    Value<String>? timestamp,
  }) {
    return ActivityHistoriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
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
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _uploaderIdMeta = const VerificationMeta(
    'uploaderId',
  );
  @override
  late final GeneratedColumn<String> uploaderId = GeneratedColumn<String>(
    'uploader_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (firebase_uid) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tipeDokumenMeta = const VerificationMeta(
    'tipeDokumen',
  );
  @override
  late final GeneratedColumn<String> tipeDokumen = GeneratedColumn<String>(
    'tipe_dokumen',
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
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _tanggalUploadMeta = const VerificationMeta(
    'tanggalUpload',
  );
  @override
  late final GeneratedColumn<String> tanggalUpload = GeneratedColumn<String>(
    'tanggal_upload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proyekId,
    uploaderId,
    tipeDokumen,
    fileUrl,
    status,
    tanggalUpload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
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
    if (data.containsKey('uploader_id')) {
      context.handle(
        _uploaderIdMeta,
        uploaderId.isAcceptableOrUnknown(data['uploader_id']!, _uploaderIdMeta),
      );
    }
    if (data.containsKey('tipe_dokumen')) {
      context.handle(
        _tipeDokumenMeta,
        tipeDokumen.isAcceptableOrUnknown(
          data['tipe_dokumen']!,
          _tipeDokumenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipeDokumenMeta);
    }
    if (data.containsKey('file_url')) {
      context.handle(
        _fileUrlMeta,
        fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('tanggal_upload')) {
      context.handle(
        _tanggalUploadMeta,
        tanggalUpload.isAcceptableOrUnknown(
          data['tanggal_upload']!,
          _tanggalUploadMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalUploadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proyekId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proyek_id'],
      )!,
      uploaderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uploader_id'],
      ),
      tipeDokumen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipe_dokumen'],
      )!,
      fileUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_url'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      tanggalUpload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tanggal_upload'],
      )!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final int proyekId;
  final String? uploaderId;
  final String tipeDokumen;
  final String fileUrl;
  final String status;
  final String tanggalUpload;
  const Document({
    required this.id,
    required this.proyekId,
    this.uploaderId,
    required this.tipeDokumen,
    required this.fileUrl,
    required this.status,
    required this.tanggalUpload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proyek_id'] = Variable<int>(proyekId);
    if (!nullToAbsent || uploaderId != null) {
      map['uploader_id'] = Variable<String>(uploaderId);
    }
    map['tipe_dokumen'] = Variable<String>(tipeDokumen);
    map['file_url'] = Variable<String>(fileUrl);
    map['status'] = Variable<String>(status);
    map['tanggal_upload'] = Variable<String>(tanggalUpload);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      proyekId: Value(proyekId),
      uploaderId: uploaderId == null && nullToAbsent
          ? const Value.absent()
          : Value(uploaderId),
      tipeDokumen: Value(tipeDokumen),
      fileUrl: Value(fileUrl),
      status: Value(status),
      tanggalUpload: Value(tanggalUpload),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      proyekId: serializer.fromJson<int>(json['proyekId']),
      uploaderId: serializer.fromJson<String?>(json['uploaderId']),
      tipeDokumen: serializer.fromJson<String>(json['tipeDokumen']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      status: serializer.fromJson<String>(json['status']),
      tanggalUpload: serializer.fromJson<String>(json['tanggalUpload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proyekId': serializer.toJson<int>(proyekId),
      'uploaderId': serializer.toJson<String?>(uploaderId),
      'tipeDokumen': serializer.toJson<String>(tipeDokumen),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'status': serializer.toJson<String>(status),
      'tanggalUpload': serializer.toJson<String>(tanggalUpload),
    };
  }

  Document copyWith({
    int? id,
    int? proyekId,
    Value<String?> uploaderId = const Value.absent(),
    String? tipeDokumen,
    String? fileUrl,
    String? status,
    String? tanggalUpload,
  }) => Document(
    id: id ?? this.id,
    proyekId: proyekId ?? this.proyekId,
    uploaderId: uploaderId.present ? uploaderId.value : this.uploaderId,
    tipeDokumen: tipeDokumen ?? this.tipeDokumen,
    fileUrl: fileUrl ?? this.fileUrl,
    status: status ?? this.status,
    tanggalUpload: tanggalUpload ?? this.tanggalUpload,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      proyekId: data.proyekId.present ? data.proyekId.value : this.proyekId,
      uploaderId: data.uploaderId.present
          ? data.uploaderId.value
          : this.uploaderId,
      tipeDokumen: data.tipeDokumen.present
          ? data.tipeDokumen.value
          : this.tipeDokumen,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      status: data.status.present ? data.status.value : this.status,
      tanggalUpload: data.tanggalUpload.present
          ? data.tanggalUpload.value
          : this.tanggalUpload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('uploaderId: $uploaderId, ')
          ..write('tipeDokumen: $tipeDokumen, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('status: $status, ')
          ..write('tanggalUpload: $tanggalUpload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    proyekId,
    uploaderId,
    tipeDokumen,
    fileUrl,
    status,
    tanggalUpload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.proyekId == this.proyekId &&
          other.uploaderId == this.uploaderId &&
          other.tipeDokumen == this.tipeDokumen &&
          other.fileUrl == this.fileUrl &&
          other.status == this.status &&
          other.tanggalUpload == this.tanggalUpload);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<int> proyekId;
  final Value<String?> uploaderId;
  final Value<String> tipeDokumen;
  final Value<String> fileUrl;
  final Value<String> status;
  final Value<String> tanggalUpload;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.proyekId = const Value.absent(),
    this.uploaderId = const Value.absent(),
    this.tipeDokumen = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.status = const Value.absent(),
    this.tanggalUpload = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int proyekId,
    this.uploaderId = const Value.absent(),
    required String tipeDokumen,
    required String fileUrl,
    this.status = const Value.absent(),
    required String tanggalUpload,
  }) : proyekId = Value(proyekId),
       tipeDokumen = Value(tipeDokumen),
       fileUrl = Value(fileUrl),
       tanggalUpload = Value(tanggalUpload);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<int>? proyekId,
    Expression<String>? uploaderId,
    Expression<String>? tipeDokumen,
    Expression<String>? fileUrl,
    Expression<String>? status,
    Expression<String>? tanggalUpload,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proyekId != null) 'proyek_id': proyekId,
      if (uploaderId != null) 'uploader_id': uploaderId,
      if (tipeDokumen != null) 'tipe_dokumen': tipeDokumen,
      if (fileUrl != null) 'file_url': fileUrl,
      if (status != null) 'status': status,
      if (tanggalUpload != null) 'tanggal_upload': tanggalUpload,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? proyekId,
    Value<String?>? uploaderId,
    Value<String>? tipeDokumen,
    Value<String>? fileUrl,
    Value<String>? status,
    Value<String>? tanggalUpload,
  }) {
    return DocumentsCompanion(
      id: id ?? this.id,
      proyekId: proyekId ?? this.proyekId,
      uploaderId: uploaderId ?? this.uploaderId,
      tipeDokumen: tipeDokumen ?? this.tipeDokumen,
      fileUrl: fileUrl ?? this.fileUrl,
      status: status ?? this.status,
      tanggalUpload: tanggalUpload ?? this.tanggalUpload,
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
    if (uploaderId.present) {
      map['uploader_id'] = Variable<String>(uploaderId.value);
    }
    if (tipeDokumen.present) {
      map['tipe_dokumen'] = Variable<String>(tipeDokumen.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (tanggalUpload.present) {
      map['tanggal_upload'] = Variable<String>(tanggalUpload.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('proyekId: $proyekId, ')
          ..write('uploaderId: $uploaderId, ')
          ..write('tipeDokumen: $tipeDokumen, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('status: $status, ')
          ..write('tanggalUpload: $tanggalUpload')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ActivityHistoriesTable activityHistories =
      $ActivityHistoriesTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    projects,
    reports,
    tasks,
    activityHistories,
    documents,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('projects', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('projects', kind: UpdateKind.update)],
    ),
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
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('activity_histories', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('documents', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('documents', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String firebaseUid,
      required String nama,
      Value<String?> email,
      required String peran,
      Value<String?> nomorHp,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> firebaseUid,
      Value<String> nama,
      Value<String?> email,
      Value<String> peran,
      Value<String?> nomorHp,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReportsTable, List<Report>> _reportsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reports,
    aliasName: $_aliasNameGenerator(db.users.firebaseUid, db.reports.pembuatId),
  );

  $$ReportsTableProcessedTableManager get reportsRefs {
    final manager = $$ReportsTableTableManager($_db, $_db.reports).filter(
      (f) => f.pembuatId.firebaseUid.sqlEquals(
        $_itemColumn<String>('firebase_uid')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_reportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ActivityHistoriesTable, List<ActivityHistory>>
  _activityHistoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.activityHistories,
        aliasName: $_aliasNameGenerator(
          db.users.firebaseUid,
          db.activityHistories.userId,
        ),
      );

  $$ActivityHistoriesTableProcessedTableManager get activityHistoriesRefs {
    final manager =
        $$ActivityHistoriesTableTableManager(
          $_db,
          $_db.activityHistories,
        ).filter(
          (f) => f.userId.firebaseUid.sqlEquals(
            $_itemColumn<String>('firebase_uid')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _activityHistoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DocumentsTable, List<Document>>
  _documentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documents,
    aliasName: $_aliasNameGenerator(
      db.users.firebaseUid,
      db.documents.uploaderId,
    ),
  );

  $$DocumentsTableProcessedTableManager get documentsRefs {
    final manager = $$DocumentsTableTableManager($_db, $_db.documents).filter(
      (f) => f.uploaderId.firebaseUid.sqlEquals(
        $_itemColumn<String>('firebase_uid')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_documentsRefsTable($_db));
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
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

  Expression<bool> reportsRefs(
    Expression<bool> Function($$ReportsTableFilterComposer f) f,
  ) {
    final $$ReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.pembuatId,
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

  Expression<bool> activityHistoriesRefs(
    Expression<bool> Function($$ActivityHistoriesTableFilterComposer f) f,
  ) {
    final $$ActivityHistoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.activityHistories,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityHistoriesTableFilterComposer(
            $db: $db,
            $table: $db.activityHistories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> documentsRefs(
    Expression<bool> Function($$DocumentsTableFilterComposer f) f,
  ) {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.uploaderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableFilterComposer(
            $db: $db,
            $table: $db.documents,
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get peran =>
      $composableBuilder(column: $table.peran, builder: (column) => column);

  GeneratedColumn<String> get nomorHp =>
      $composableBuilder(column: $table.nomorHp, builder: (column) => column);

  Expression<T> reportsRefs<T extends Object>(
    Expression<T> Function($$ReportsTableAnnotationComposer a) f,
  ) {
    final $$ReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.reports,
      getReferencedColumn: (t) => t.pembuatId,
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

  Expression<T> activityHistoriesRefs<T extends Object>(
    Expression<T> Function($$ActivityHistoriesTableAnnotationComposer a) f,
  ) {
    final $$ActivityHistoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.firebaseUid,
          referencedTable: $db.activityHistories,
          getReferencedColumn: (t) => t.userId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ActivityHistoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.activityHistories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> documentsRefs<T extends Object>(
    Expression<T> Function($$DocumentsTableAnnotationComposer a) f,
  ) {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.firebaseUid,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.uploaderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.documents,
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
            bool reportsRefs,
            bool activityHistoriesRefs,
            bool documentsRefs,
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
                Value<String?> email = const Value.absent(),
                Value<String> peran = const Value.absent(),
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                firebaseUid: firebaseUid,
                nama: nama,
                email: email,
                peran: peran,
                nomorHp: nomorHp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String firebaseUid,
                required String nama,
                Value<String?> email = const Value.absent(),
                required String peran,
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                firebaseUid: firebaseUid,
                nama: nama,
                email: email,
                peran: peran,
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
                reportsRefs = false,
                activityHistoriesRefs = false,
                documentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reportsRefs) db.reports,
                    if (activityHistoriesRefs) db.activityHistories,
                    if (documentsRefs) db.documents,
                  ],
                  addJoins: null,
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
                                (e) => e.pembuatId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (activityHistoriesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ActivityHistory
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._activityHistoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).activityHistoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.firebaseUid,
                              ),
                          typedResults: items,
                        ),
                      if (documentsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Document>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._documentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).documentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.uploaderId == item.firebaseUid,
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
        bool reportsRefs,
        bool activityHistoriesRefs,
        bool documentsRefs,
      })
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      required String namaProyek,
      Value<String?> lokasi,
      Value<String?> kategori,
      Value<String?> tanggalMulai,
      Value<String?> tanggalSelesai,
      Value<double?> nilaiKontrak,
      Value<String?> kontraktorId,
      Value<String?> dinasId,
      Value<String> status,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<int> id,
      Value<String> namaProyek,
      Value<String?> lokasi,
      Value<String?> kategori,
      Value<String?> tanggalMulai,
      Value<String?> tanggalSelesai,
      Value<double?> nilaiKontrak,
      Value<String?> kontraktorId,
      Value<String?> dinasId,
      Value<String> status,
    });

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _kontraktorIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.projects.kontraktorId, db.users.firebaseUid),
      );

  $$UsersTableProcessedTableManager? get kontraktorId {
    final $_column = $_itemColumn<String>('kontraktor_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_kontraktorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _dinasIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.projects.dinasId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager? get dinasId {
    final $_column = $_itemColumn<String>('dinas_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dinasIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

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

  static MultiTypedResultKey<$DocumentsTable, List<Document>>
  _documentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.documents,
    aliasName: $_aliasNameGenerator(db.projects.id, db.documents.proyekId),
  );

  $$DocumentsTableProcessedTableManager get documentsRefs {
    final manager = $$DocumentsTableTableManager(
      $_db,
      $_db.documents,
    ).filter((f) => f.proyekId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_documentsRefsTable($_db));
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

  ColumnFilters<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggalSelesai => $composableBuilder(
    column: $table.tanggalSelesai,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get nilaiKontrak => $composableBuilder(
    column: $table.nilaiKontrak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get kontraktorId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.kontraktorId,
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

  $$UsersTableFilterComposer get dinasId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dinasId,
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

  Expression<bool> documentsRefs(
    Expression<bool> Function($$DocumentsTableFilterComposer f) f,
  ) {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableFilterComposer(
            $db: $db,
            $table: $db.documents,
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

  ColumnOrderings<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggalSelesai => $composableBuilder(
    column: $table.tanggalSelesai,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get nilaiKontrak => $composableBuilder(
    column: $table.nilaiKontrak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get kontraktorId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.kontraktorId,
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

  $$UsersTableOrderingComposer get dinasId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dinasId,
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

  GeneratedColumn<String> get kategori =>
      $composableBuilder(column: $table.kategori, builder: (column) => column);

  GeneratedColumn<String> get tanggalMulai => $composableBuilder(
    column: $table.tanggalMulai,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tanggalSelesai => $composableBuilder(
    column: $table.tanggalSelesai,
    builder: (column) => column,
  );

  GeneratedColumn<double> get nilaiKontrak => $composableBuilder(
    column: $table.nilaiKontrak,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$UsersTableAnnotationComposer get kontraktorId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.kontraktorId,
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

  $$UsersTableAnnotationComposer get dinasId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dinasId,
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

  Expression<T> documentsRefs<T extends Object>(
    Expression<T> Function($$DocumentsTableAnnotationComposer a) f,
  ) {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.proyekId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.documents,
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
            bool kontraktorId,
            bool dinasId,
            bool reportsRefs,
            bool documentsRefs,
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
                Value<String?> kategori = const Value.absent(),
                Value<String?> tanggalMulai = const Value.absent(),
                Value<String?> tanggalSelesai = const Value.absent(),
                Value<double?> nilaiKontrak = const Value.absent(),
                Value<String?> kontraktorId = const Value.absent(),
                Value<String?> dinasId = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProjectsCompanion(
                id: id,
                namaProyek: namaProyek,
                lokasi: lokasi,
                kategori: kategori,
                tanggalMulai: tanggalMulai,
                tanggalSelesai: tanggalSelesai,
                nilaiKontrak: nilaiKontrak,
                kontraktorId: kontraktorId,
                dinasId: dinasId,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaProyek,
                Value<String?> lokasi = const Value.absent(),
                Value<String?> kategori = const Value.absent(),
                Value<String?> tanggalMulai = const Value.absent(),
                Value<String?> tanggalSelesai = const Value.absent(),
                Value<double?> nilaiKontrak = const Value.absent(),
                Value<String?> kontraktorId = const Value.absent(),
                Value<String?> dinasId = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => ProjectsCompanion.insert(
                id: id,
                namaProyek: namaProyek,
                lokasi: lokasi,
                kategori: kategori,
                tanggalMulai: tanggalMulai,
                tanggalSelesai: tanggalSelesai,
                nilaiKontrak: nilaiKontrak,
                kontraktorId: kontraktorId,
                dinasId: dinasId,
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
                kontraktorId = false,
                dinasId = false,
                reportsRefs = false,
                documentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (reportsRefs) db.reports,
                    if (documentsRefs) db.documents,
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
                        if (kontraktorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.kontraktorId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._kontraktorIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._kontraktorIdTable(db)
                                        .firebaseUid,
                                  )
                                  as T;
                        }
                        if (dinasId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dinasId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._dinasIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._dinasIdTable(db)
                                        .firebaseUid,
                                  )
                                  as T;
                        }

                        return state;
                      },
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
                      if (documentsRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          Document
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._documentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).documentsRefs,
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
        bool kontraktorId,
        bool dinasId,
        bool reportsRefs,
        bool documentsRefs,
      })
    >;
typedef $$ReportsTableCreateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      required int proyekId,
      Value<String?> pembuatId,
      Value<String> tipeLaporan,
      required String tanggal,
      Value<String?> deskripsi,
      Value<String?> fotoUrl,
      Value<String?> geotagLokasi,
      Value<String?> fotoSelfieUrl,
      Value<int> progress,
      Value<String> status,
      Value<String?> catatanRevisi,
    });
typedef $$ReportsTableUpdateCompanionBuilder =
    ReportsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<String?> pembuatId,
      Value<String> tipeLaporan,
      Value<String> tanggal,
      Value<String?> deskripsi,
      Value<String?> fotoUrl,
      Value<String?> geotagLokasi,
      Value<String?> fotoSelfieUrl,
      Value<int> progress,
      Value<String> status,
      Value<String?> catatanRevisi,
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

  static $UsersTable _pembuatIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.reports.pembuatId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager? get pembuatId {
    final $_column = $_itemColumn<String>('pembuat_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pembuatIdTable($_db));
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

  ColumnFilters<String> get tipeLaporan => $composableBuilder(
    column: $table.tipeLaporan,
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

  ColumnFilters<String> get geotagLokasi => $composableBuilder(
    column: $table.geotagLokasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fotoSelfieUrl => $composableBuilder(
    column: $table.fotoSelfieUrl,
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

  ColumnFilters<String> get catatanRevisi => $composableBuilder(
    column: $table.catatanRevisi,
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

  $$UsersTableFilterComposer get pembuatId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pembuatId,
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

  ColumnOrderings<String> get tipeLaporan => $composableBuilder(
    column: $table.tipeLaporan,
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

  ColumnOrderings<String> get geotagLokasi => $composableBuilder(
    column: $table.geotagLokasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fotoSelfieUrl => $composableBuilder(
    column: $table.fotoSelfieUrl,
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

  ColumnOrderings<String> get catatanRevisi => $composableBuilder(
    column: $table.catatanRevisi,
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

  $$UsersTableOrderingComposer get pembuatId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pembuatId,
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

  GeneratedColumn<String> get tipeLaporan => $composableBuilder(
    column: $table.tipeLaporan,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tanggal =>
      $composableBuilder(column: $table.tanggal, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<String> get fotoUrl =>
      $composableBuilder(column: $table.fotoUrl, builder: (column) => column);

  GeneratedColumn<String> get geotagLokasi => $composableBuilder(
    column: $table.geotagLokasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fotoSelfieUrl => $composableBuilder(
    column: $table.fotoSelfieUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get catatanRevisi => $composableBuilder(
    column: $table.catatanRevisi,
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

  $$UsersTableAnnotationComposer get pembuatId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pembuatId,
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
            bool pembuatId,
            bool tasksRefs,
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
                Value<String?> pembuatId = const Value.absent(),
                Value<String> tipeLaporan = const Value.absent(),
                Value<String> tanggal = const Value.absent(),
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoUrl = const Value.absent(),
                Value<String?> geotagLokasi = const Value.absent(),
                Value<String?> fotoSelfieUrl = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> catatanRevisi = const Value.absent(),
              }) => ReportsCompanion(
                id: id,
                proyekId: proyekId,
                pembuatId: pembuatId,
                tipeLaporan: tipeLaporan,
                tanggal: tanggal,
                deskripsi: deskripsi,
                fotoUrl: fotoUrl,
                geotagLokasi: geotagLokasi,
                fotoSelfieUrl: fotoSelfieUrl,
                progress: progress,
                status: status,
                catatanRevisi: catatanRevisi,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                Value<String?> pembuatId = const Value.absent(),
                Value<String> tipeLaporan = const Value.absent(),
                required String tanggal,
                Value<String?> deskripsi = const Value.absent(),
                Value<String?> fotoUrl = const Value.absent(),
                Value<String?> geotagLokasi = const Value.absent(),
                Value<String?> fotoSelfieUrl = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> catatanRevisi = const Value.absent(),
              }) => ReportsCompanion.insert(
                id: id,
                proyekId: proyekId,
                pembuatId: pembuatId,
                tipeLaporan: tipeLaporan,
                tanggal: tanggal,
                deskripsi: deskripsi,
                fotoUrl: fotoUrl,
                geotagLokasi: geotagLokasi,
                fotoSelfieUrl: fotoSelfieUrl,
                progress: progress,
                status: status,
                catatanRevisi: catatanRevisi,
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
              ({proyekId = false, pembuatId = false, tasksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (tasksRefs) db.tasks],
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
                        if (pembuatId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pembuatId,
                                    referencedTable: $$ReportsTableReferences
                                        ._pembuatIdTable(db),
                                    referencedColumn: $$ReportsTableReferences
                                        ._pembuatIdTable(db)
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
      PrefetchHooks Function({bool proyekId, bool pembuatId, bool tasksRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required int reportId,
      required String namaPekerjaan,
      Value<double?> volumeTarget,
      Value<double?> volumeRealisasi,
      Value<String?> satuan,
      Value<bool> isSelesai,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<int> reportId,
      Value<String> namaPekerjaan,
      Value<double?> volumeTarget,
      Value<double?> volumeRealisasi,
      Value<String?> satuan,
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

  ColumnFilters<double> get volumeTarget => $composableBuilder(
    column: $table.volumeTarget,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volumeRealisasi => $composableBuilder(
    column: $table.volumeRealisasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get satuan => $composableBuilder(
    column: $table.satuan,
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

  ColumnOrderings<double> get volumeTarget => $composableBuilder(
    column: $table.volumeTarget,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volumeRealisasi => $composableBuilder(
    column: $table.volumeRealisasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get satuan => $composableBuilder(
    column: $table.satuan,
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

  GeneratedColumn<double> get volumeTarget => $composableBuilder(
    column: $table.volumeTarget,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volumeRealisasi => $composableBuilder(
    column: $table.volumeRealisasi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get satuan =>
      $composableBuilder(column: $table.satuan, builder: (column) => column);

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
                Value<double?> volumeTarget = const Value.absent(),
                Value<double?> volumeRealisasi = const Value.absent(),
                Value<String?> satuan = const Value.absent(),
                Value<bool> isSelesai = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                reportId: reportId,
                namaPekerjaan: namaPekerjaan,
                volumeTarget: volumeTarget,
                volumeRealisasi: volumeRealisasi,
                satuan: satuan,
                isSelesai: isSelesai,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reportId,
                required String namaPekerjaan,
                Value<double?> volumeTarget = const Value.absent(),
                Value<double?> volumeRealisasi = const Value.absent(),
                Value<String?> satuan = const Value.absent(),
                Value<bool> isSelesai = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                reportId: reportId,
                namaPekerjaan: namaPekerjaan,
                volumeTarget: volumeTarget,
                volumeRealisasi: volumeRealisasi,
                satuan: satuan,
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
typedef $$ActivityHistoriesTableCreateCompanionBuilder =
    ActivityHistoriesCompanion Function({
      Value<int> id,
      Value<String?> userId,
      required String action,
      required String entityType,
      required String entityId,
      required String description,
      required String timestamp,
    });
typedef $$ActivityHistoriesTableUpdateCompanionBuilder =
    ActivityHistoriesCompanion Function({
      Value<int> id,
      Value<String?> userId,
      Value<String> action,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> description,
      Value<String> timestamp,
    });

final class $$ActivityHistoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ActivityHistoriesTable,
          ActivityHistory
        > {
  $$ActivityHistoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.activityHistories.userId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager? get userId {
    final $_column = $_itemColumn<String>('user_id');
    if ($_column == null) return null;
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

class $$ActivityHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityHistoriesTable> {
  $$ActivityHistoriesTableFilterComposer({
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

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
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

class $$ActivityHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityHistoriesTable> {
  $$ActivityHistoriesTableOrderingComposer({
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

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timestamp => $composableBuilder(
    column: $table.timestamp,
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

class $$ActivityHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityHistoriesTable> {
  $$ActivityHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

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

class $$ActivityHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityHistoriesTable,
          ActivityHistory,
          $$ActivityHistoriesTableFilterComposer,
          $$ActivityHistoriesTableOrderingComposer,
          $$ActivityHistoriesTableAnnotationComposer,
          $$ActivityHistoriesTableCreateCompanionBuilder,
          $$ActivityHistoriesTableUpdateCompanionBuilder,
          (ActivityHistory, $$ActivityHistoriesTableReferences),
          ActivityHistory,
          PrefetchHooks Function({bool userId})
        > {
  $$ActivityHistoriesTableTableManager(
    _$AppDatabase db,
    $ActivityHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> timestamp = const Value.absent(),
              }) => ActivityHistoriesCompanion(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                description: description,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                required String action,
                required String entityType,
                required String entityId,
                required String description,
                required String timestamp,
              }) => ActivityHistoriesCompanion.insert(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                description: description,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActivityHistoriesTableReferences(db, table, e),
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
                                referencedTable:
                                    $$ActivityHistoriesTableReferences
                                        ._userIdTable(db),
                                referencedColumn:
                                    $$ActivityHistoriesTableReferences
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

typedef $$ActivityHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityHistoriesTable,
      ActivityHistory,
      $$ActivityHistoriesTableFilterComposer,
      $$ActivityHistoriesTableOrderingComposer,
      $$ActivityHistoriesTableAnnotationComposer,
      $$ActivityHistoriesTableCreateCompanionBuilder,
      $$ActivityHistoriesTableUpdateCompanionBuilder,
      (ActivityHistory, $$ActivityHistoriesTableReferences),
      ActivityHistory,
      PrefetchHooks Function({bool userId})
    >;
typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      required int proyekId,
      Value<String?> uploaderId,
      required String tipeDokumen,
      required String fileUrl,
      Value<String> status,
      required String tanggalUpload,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      Value<int> proyekId,
      Value<String?> uploaderId,
      Value<String> tipeDokumen,
      Value<String> fileUrl,
      Value<String> status,
      Value<String> tanggalUpload,
    });

final class $$DocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentsTable, Document> {
  $$DocumentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProjectsTable _proyekIdTable(_$AppDatabase db) => db.projects
      .createAlias($_aliasNameGenerator(db.documents.proyekId, db.projects.id));

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

  static $UsersTable _uploaderIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.documents.uploaderId, db.users.firebaseUid),
  );

  $$UsersTableProcessedTableManager? get uploaderId {
    final $_column = $_itemColumn<String>('uploader_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.firebaseUid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_uploaderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
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

  ColumnFilters<String> get tipeDokumen => $composableBuilder(
    column: $table.tipeDokumen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
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

  $$UsersTableFilterComposer get uploaderId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uploaderId,
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

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
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

  ColumnOrderings<String> get tipeDokumen => $composableBuilder(
    column: $table.tipeDokumen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileUrl => $composableBuilder(
    column: $table.fileUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
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

  $$UsersTableOrderingComposer get uploaderId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uploaderId,
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

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipeDokumen => $composableBuilder(
    column: $table.tipeDokumen,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get tanggalUpload => $composableBuilder(
    column: $table.tanggalUpload,
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

  $$UsersTableAnnotationComposer get uploaderId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uploaderId,
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

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, $$DocumentsTableReferences),
          Document,
          PrefetchHooks Function({bool proyekId, bool uploaderId})
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proyekId = const Value.absent(),
                Value<String?> uploaderId = const Value.absent(),
                Value<String> tipeDokumen = const Value.absent(),
                Value<String> fileUrl = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> tanggalUpload = const Value.absent(),
              }) => DocumentsCompanion(
                id: id,
                proyekId: proyekId,
                uploaderId: uploaderId,
                tipeDokumen: tipeDokumen,
                fileUrl: fileUrl,
                status: status,
                tanggalUpload: tanggalUpload,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proyekId,
                Value<String?> uploaderId = const Value.absent(),
                required String tipeDokumen,
                required String fileUrl,
                Value<String> status = const Value.absent(),
                required String tanggalUpload,
              }) => DocumentsCompanion.insert(
                id: id,
                proyekId: proyekId,
                uploaderId: uploaderId,
                tipeDokumen: tipeDokumen,
                fileUrl: fileUrl,
                status: status,
                tanggalUpload: tanggalUpload,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({proyekId = false, uploaderId = false}) {
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
                                referencedTable: $$DocumentsTableReferences
                                    ._proyekIdTable(db),
                                referencedColumn: $$DocumentsTableReferences
                                    ._proyekIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (uploaderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.uploaderId,
                                referencedTable: $$DocumentsTableReferences
                                    ._uploaderIdTable(db),
                                referencedColumn: $$DocumentsTableReferences
                                    ._uploaderIdTable(db)
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

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, $$DocumentsTableReferences),
      Document,
      PrefetchHooks Function({bool proyekId, bool uploaderId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$ReportsTableTableManager get reports =>
      $$ReportsTableTableManager(_db, _db.reports);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$ActivityHistoriesTableTableManager get activityHistories =>
      $$ActivityHistoriesTableTableManager(_db, _db.activityHistories);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
}
