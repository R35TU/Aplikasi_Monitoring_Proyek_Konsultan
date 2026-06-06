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
  List<GeneratedColumn> get $columns => [firebaseUid, nama, peran, nomorHp];
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
  final String peran;
  final String? nomorHp;
  const User({
    required this.firebaseUid,
    required this.nama,
    required this.peran,
    this.nomorHp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firebase_uid'] = Variable<String>(firebaseUid);
    map['nama'] = Variable<String>(nama);
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
      'peran': serializer.toJson<String>(peran),
      'nomorHp': serializer.toJson<String?>(nomorHp),
    };
  }

  User copyWith({
    String? firebaseUid,
    String? nama,
    String? peran,
    Value<String?> nomorHp = const Value.absent(),
  }) => User(
    firebaseUid: firebaseUid ?? this.firebaseUid,
    nama: nama ?? this.nama,
    peran: peran ?? this.peran,
    nomorHp: nomorHp.present ? nomorHp.value : this.nomorHp,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      nama: data.nama.present ? data.nama.value : this.nama,
      peran: data.peran.present ? data.peran.value : this.peran,
      nomorHp: data.nomorHp.present ? data.nomorHp.value : this.nomorHp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('nama: $nama, ')
          ..write('peran: $peran, ')
          ..write('nomorHp: $nomorHp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(firebaseUid, nama, peran, nomorHp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.firebaseUid == this.firebaseUid &&
          other.nama == this.nama &&
          other.peran == this.peran &&
          other.nomorHp == this.nomorHp);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> firebaseUid;
  final Value<String> nama;
  final Value<String> peran;
  final Value<String?> nomorHp;
  final Value<int> rowid;
  const UsersCompanion({
    this.firebaseUid = const Value.absent(),
    this.nama = const Value.absent(),
    this.peran = const Value.absent(),
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String firebaseUid,
    required String nama,
    required String peran,
    this.nomorHp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : firebaseUid = Value(firebaseUid),
       nama = Value(nama),
       peran = Value(peran);
  static Insertable<User> custom({
    Expression<String>? firebaseUid,
    Expression<String>? nama,
    Expression<String>? peran,
    Expression<String>? nomorHp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (nama != null) 'nama': nama,
      if (peran != null) 'peran': peran,
      if (nomorHp != null) 'nomor_hp': nomorHp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? firebaseUid,
    Value<String>? nama,
    Value<String>? peran,
    Value<String?>? nomorHp,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      firebaseUid: firebaseUid ?? this.firebaseUid,
      nama: nama ?? this.nama,
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $ReportsTable reports = $ReportsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    projects,
    reports,
    tasks,
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

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String firebaseUid,
      required String nama,
      required String peran,
      Value<String?> nomorHp,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> firebaseUid,
      Value<String> nama,
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
          PrefetchHooks Function({bool reportsRefs})
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
                Value<String> peran = const Value.absent(),
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                firebaseUid: firebaseUid,
                nama: nama,
                peran: peran,
                nomorHp: nomorHp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String firebaseUid,
                required String nama,
                required String peran,
                Value<String?> nomorHp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                firebaseUid: firebaseUid,
                nama: nama,
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
          prefetchHooksCallback: ({reportsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reportsRefs) db.reports],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reportsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Report>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences._reportsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).reportsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.pengawasId == item.firebaseUid,
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
      PrefetchHooks Function({bool reportsRefs})
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
          PrefetchHooks Function({bool reportsRefs})
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
          prefetchHooksCallback: ({reportsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (reportsRefs) db.reports],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reportsRefs)
                    await $_getPrefetchedData<Project, $ProjectsTable, Report>(
                      currentTable: table,
                      referencedTable: $$ProjectsTableReferences
                          ._reportsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProjectsTableReferences(db, table, p0).reportsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.proyekId == item.id),
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
      PrefetchHooks Function({bool reportsRefs})
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
              ({proyekId = false, pengawasId = false, tasksRefs = false}) {
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
      PrefetchHooks Function({bool proyekId, bool pengawasId, bool tasksRefs})
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
}
