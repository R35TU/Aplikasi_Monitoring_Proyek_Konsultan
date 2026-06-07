# 🏗️ CV. TATA SAKA CONSULTANT — Sistem Informasi Pengelolaan Laporan Proyek

> Aplikasi Sistem Informasi CV. TATA SAKA CONSULTANT untuk mentracking kinerja proyek secara detail — berbasis Flutter Web (PWA) dengan penyimpanan lokal SQLite via Drift.

---

## 👥 Anggota Kelompok

| NIM          | Nama                    |
| ------------ | ----------------------- |
| 103122400005 | Nadia Tambunan          |
| 103122400007 | Putra Anugrah Pamungkas |
| 103122400013 | Ulung Putra Sadewo      |
| 103122400014 | Aradea Satria Permana   |
| 103122400022 | Muhammad Restu Aditya   |

---

## 🧭 Peran Kelompok (Roles)

Berikut pembagian peran yang ditetapkan untuk progres tugas ini. Posisi dipilih agar sesuai dengan keahlian tanpa merubah bagian lain dari proyek.

| Nama (panggilan) | Peran utama |
| ---------------- | ------------------------------------------------------------ |
| Ulung Putra Sadewo (Ulung) | Runtime configuration, Code reuse / library |
| Nadia Tambunan (Nadia) | Automata, Table-driven construction |
| Muhammad Restu Aditya (Restu) | Code reuse / library, Runtime configuration |
| Aradea Satria Permana (Aradea) | Parameterization / Generics, Automata |
| Putra Anugrah Pamungkas (Putra) | API, Parameterization / Generics |


## 🛠️ Tech Stack

### Frontend

| Teknologi                   | Versi  | Kegunaan                                                |
| --------------------------- | ------ | ------------------------------------------------------- |
| Flutter                     | 3.x    | Framework utama untuk membuat PWA                       |
| Riverpod                    | 2.x    | State management                                        |
| FL Chart                    | latest | Grafik untuk tracking progress proyek (Kurva S)         |
| Lucide Icons                | latest | Library icon UI                                         |
| go_router                   | latest | Declarative routing berbasis tabel konfigurasi          |
| freezed + json_serializable | latest | Immutable model & code generation (Parameterization)    |
| flutter_dotenv              | latest | Runtime environment config (dev/prod)                   |
| image_picker                | latest | Ambil foto langsung dari kamera/galeri lapangan         |
| cached_network_image        | latest | Cache foto dari Firebase Storage                        |
| pdf + printing              | latest | Export laporan harian ke format PDF                     |
| flutter_test                | latest | Unit testing & performance testing (bawaan Flutter SDK) |
| mockito                     | latest | Mock dependency untuk unit testing                      |

### Backend & Database

| Teknologi                | Kegunaan                                                    |
| ------------------------ | ----------------------------------------------------------- |
| **SQLite via Drift**     | Database utama — penyimpanan lokal terstruktur (relasional) |
| **drift_sqflite**        | Driver SQLite untuk platform Android & iOS                  |
| **sqlite3_flutter_libs** | Native SQLite binary untuk semua platform                   |
| Firebase Authentication  | Autentikasi pengguna (register, login, logout)              |
| Firebase Storage         | Penyimpanan foto dokumentasi lapangan                       |
| Firebase Cloud Messaging | Notifikasi ke pengawas & admin                              |

> 💡 **Mengapa Drift?** Drift adalah ORM untuk SQLite yang mendukung Flutter Web (via SQLite WASM), mobile, dan desktop dalam satu codebase — cocok untuk proyek PWA ini.

### Data & Tools

| Tools                 | Kegunaan                                       |
| --------------------- | ---------------------------------------------- |
| Git + GitHub          | Version control & kolaborasi                   |
| VS Code + Flutter SDK | IDE utama                                      |
| GitHub Actions        | CI/CD pipeline otomatis                        |
| DB Browser for SQLite | Inspeksi & debug database SQLite secara visual |
| .env (dev & prod)     | Konfigurasi environment runtime                |

---

## 📁 Project Structure

> 📌 Proyek ini adalah **satu Flutter project** dengan pemisahan logis di dalam `lib/`:
>
> - `lib/backend/` → semua kode yang **bersentuhan dengan database SQLite & layanan eksternal**
> - `lib/frontend/` → semua kode **pure UI** (screens, widgets, providers, routing, utils)

```
CV.TATA SAKA CONSULTANT/
├── lib/
│   │
│   ├── backend/                                    # 🔴 BACKEND – database, model, service
│   │   │
│   │   ├── config/
│   │   │   ├── app_config.dart                    # RUNTIME CONFIG – load .env dev/prod
│   │   │   └── firebase_options.dart              # RUNTIME CONFIG – generated Firebase config
│   │   │
│   │   ├── database/
│   │   │   ├── app_database.dart                  # DRIFT – definisi database & koneksi SQLite
│   │   │   ├── app_database.g.dart                # AUTO-GENERATED oleh build_runner
│   │   │   └── tables/
│   │   │       ├── users_table.dart               # DRIFT Table – skema tabel users
│   │   │       ├── projects_table.dart            # DRIFT Table – skema tabel projects
│   │   │       ├── reports_table.dart             # DRIFT Table – skema tabel laporan harian
│   │   │       └── tasks_table.dart               # DRIFT Table – skema tabel item pekerjaan
│   │   │
│   │   ├── models/                                # DEFENSIVE + PARAMETERIZATION
│   │   │   ├── user_model.dart                    # Model domain pengguna + role
│   │   │   ├── project_model.dart                 # Model domain paket proyek
│   │   │   ├── report_model.dart                  # Model domain laporan harian
│   │   │   ├── task_model.dart                    # Model domain item pekerjaan
│   │   │   └── db_result.dart                     # PARAMETERIZATION – DbResult<T> wrapper
│   │   │
│   │   ├── repositories/
│   │   │   ├── base_repository.dart               # PARAMETERIZATION – abstract BaseRepo<T>
│   │   │   ├── project_repository.dart            # extends BaseRepository<ProjectModel>
│   │   │   ├── report_repository.dart             # extends BaseRepository<ReportModel>
│   │   │   └── user_repository.dart               # extends BaseRepository<UserModel>
│   │   │
│   │   ├── services/
│   │   │   ├── auth_service.dart                  # API – Firebase Authentication
│   │   │   ├── storage_service.dart               # API – Firebase Storage (upload/download foto)
│   │   │   ├── notification_service.dart          # API – Firebase Cloud Messaging (FCM)
│   │   │   └── pdf_service.dart                   # CODE REUSE – generate & export PDF laporan
│   │   │
│   │   └── constants/
│   │       └── role_permissions.dart              # TABLE-DRIVEN – Map role → allowed actions
│   │
│   ├── frontend/                                  # 🔵 FRONTEND – pure UI & state
│   │   │
│   │   ├── core/
│   │   │   ├── constants/
│   │   │   │   ├── app_constants.dart             # Konstanta global (label, nilai default)
│   │   │   │   └── status_config.dart             # TABLE-DRIVEN – Map status → warna/label/icon
│   │   │   ├── router/
│   │   │   │   └── app_router.dart                # TABLE-DRIVEN – route table via go_router
│   │   │   └── theme/
│   │   │       └── app_theme.dart                 # Tema & warna brand global
│   │   │
│   │   ├── providers/
│   │   │   ├── auth_provider.dart                 # AUTOMATA – FSM autentikasi
│   │   │   ├── report_provider.dart               # AUTOMATA – FSM workflow laporan
│   │   │   ├── upload_provider.dart               # AUTOMATA – FSM upload foto
│   │   │   └── project_provider.dart              # State management proyek aktif
│   │   │
│   │   ├── ui/
│   │   │   ├── screens/
│   │   │   │   ├── auth/
│   │   │   │   │   ├── login_page.dart
│   │   │   │   │   └── reset_password_page.dart
│   │   │   │   ├── dashboard/
│   │   │   │   │   └── dashboard_page.dart        # Overview proyek + Kurva S
│   │   │   │   ├── project/
│   │   │   │   │   ├── project_list_page.dart
│   │   │   │   │   └── project_detail_page.dart
│   │   │   │   ├── report/
│   │   │   │   │   ├── report_form_page.dart      # Input laporan harian dari lapangan
│   │   │   │   │   ├── report_list_page.dart
│   │   │   │   │   └── report_detail_page.dart
│   │   │   │   └── admin/
│   │   │   │       ├── user_management_page.dart
│   │   │   │       └── access_control_page.dart   # Kelola izin akses APH/eksternal
│   │   │   │
│   │   │   └── widgets/                           # CODE REUSE – komponen reusable
│   │   │       ├── project_card.dart              # Card ringkasan paket proyek
│   │   │       ├── progress_chart.dart            # Wrapper FL Chart – progress bar
│   │   │       ├── s_curve_chart.dart             # Kurva S proyek
│   │   │       ├── status_badge.dart              # Badge status (TABLE-DRIVEN status_config)
│   │   │       ├── role_guard.dart                # Guard akses (TABLE-DRIVEN role_permissions)
│   │   │       └── photo_upload_widget.dart       # Komponen upload foto (reusable)
│   │   │
│   │   └── utils/
│   │       ├── validators.dart                    # DEFENSIVE – validasi input form
│   │       ├── date_formatter.dart                # Utility format tanggal
│   │       └── permission_checker.dart            # TABLE-DRIVEN – lookup role → akses halaman
│   │
│   ├── app.dart                                   # Root widget aplikasi
│   └── main.dart                                  # Entry point Flutter
│
├── test/
│   ├── unit/
│   │   ├── backend/
│   │   │   ├── models/                            # Unit test validasi model & DbResult
│   │   │   └── repositories/                      # Unit test CRUD repository (SQLite in-memory)
│   │   └── frontend/
│   │       └── providers/                         # Unit test FSM state/automata
│   └── performance/
│       ├── db_insert_perf_test.dart               # Performance test: bulk INSERT ke SQLite
│       ├── db_query_perf_test.dart                # Performance test: SELECT & filter query
│       └── db_update_perf_test.dart               # Performance test: UPDATE & DELETE
│
├── web/
│   ├── index.html                                 # PWA Metadata
│   ├── manifest.json
│   └── sqlite3.wasm                              # ⚠️ SQLite WASM binary untuk Flutter Web
│
├── android/
│   └── app/
│       └── google-services.json                  # ⚠️ TIDAK di-push ke GitHub
├── ios/
│   └── Runner/
│       └── GoogleService-Info.plist              # ⚠️ TIDAK di-push ke GitHub
│
├── .env.development                               # RUNTIME CONFIG – env development
├── .env.production                                # RUNTIME CONFIG – env production
├── .github/
│   └── workflows/
│       └── ci.yml                                # GitHub Actions CI/CD
├── pubspec.yaml
└── analysis_options.yaml
```

---

## 🎯 Teknik Konstruksi CLO2

> **Wajib semua anggota:** Defensive Programming / Design by Contract (DbC)
> **Per individu:** 2 teknik dari daftar berikut (maks. 2 orang per teknik dalam 1 kelompok)

### Ringkasan Teknik per Fitur

| Teknik               | File / Modul                                 | Deskripsi Implementasi                                                                   |
| -------------------- | -------------------------------------------- | ---------------------------------------------------------------------------------------- |
| **Automata**         | `frontend/providers/auth_provider.dart`      | FSM: `unauthenticated → loading → authenticated → error`                                 |
| **Automata**         | `frontend/providers/report_provider.dart`    | FSM: `draft → submitted → reviewed → approved / rejected`                                |
| **Automata**         | `frontend/providers/upload_provider.dart`    | FSM: `idle → picking → uploading → success / failed`                                     |
| **Table-driven**     | `backend/constants/role_permissions.dart`    | `Map<String, List<String>>` role → daftar aksi yang diizinkan                            |
| **Table-driven**     | `frontend/core/constants/status_config.dart` | `Map<String, StatusConfig>` status → warna, label, icon                                  |
| **Table-driven**     | `frontend/core/router/app_router.dart`       | List definisi route + required role (go_router)                                          |
| **Parameterization** | `backend/repositories/base_repository.dart`  | `abstract class BaseRepository<T>` dengan method generik                                 |
| **Parameterization** | `backend/models/db_result.dart`              | `class DbResult<T>` wrapper response success/error dari SQLite                           |
| **Runtime Config**   | `backend/config/app_config.dart`             | Load `.env.development` / `.env.production` saat startup                                 |
| **Code Reuse**       | `frontend/ui/widgets/`                       | Widget `progress_chart`, `s_curve_chart`, `photo_upload_widget` dipakai di banyak screen |
| **Code Reuse**       | `backend/services/pdf_service.dart`          | Library PDF generation dipanggil dari berbagai modul                                     |
| **API**              | `backend/services/auth_service.dart`         | Integrasi Firebase Authentication SDK                                                    |
| **API**              | `backend/services/storage_service.dart`      | Integrasi Firebase Storage — upload/download foto                                        |
| **API**              | `backend/services/notification_service.dart` | Integrasi FCM — push notification ke pengguna                                            |
| **Defensive**        | `backend/models/*.dart`                      | Validasi tipe data & null check di setiap constructor model                              |
| **Defensive**        | `frontend/utils/validators.dart`             | Validasi input form sebelum disimpan ke SQLite                                           |

---

## 👥 Pembagian Tugas

> Pembagian dilakukan per pasangan (4 orang berpasangan, 1 orang individual).
> Setiap anggota menerapkan **Defensive Programming (wajib)** + **2 teknik konstruksi pilihan**.

---

### 🔵 Pasangan 1 — Authentication & Upload Flow

**Modul yang dikerjakan:**

- `lib/frontend/providers/auth_provider.dart`
- `lib/frontend/providers/upload_provider.dart`
- `lib/frontend/providers/report_provider.dart`
- `lib/frontend/ui/screens/auth/` (login, reset password)
- `lib/frontend/ui/widgets/photo_upload_widget.dart`
- `test/unit/frontend/providers/`

**Teknik Konstruksi:**

| Teknik                       | Implementasi                                                         |
| ---------------------------- | -------------------------------------------------------------------- |
| ✅ **Automata**              | FSM untuk alur autentikasi, upload foto, dan workflow laporan harian |
| ✅ **Defensive Programming** | Validasi state transition — mencegah state tidak valid pada FSM      |

**FSM Report Workflow:**

```
[DRAFT] --submit--> [SUBMITTED] --review--> [APPROVED]
                                    \------> [REJECTED] --revise--> [DRAFT]
```

---

### 🟢 Pasangan 2 — RBAC, Routing & Utils

**Modul yang dikerjakan:**

- `lib/backend/constants/role_permissions.dart`
- `lib/frontend/core/constants/status_config.dart`
- `lib/frontend/core/router/app_router.dart`
- `lib/frontend/utils/permission_checker.dart`
- `lib/frontend/ui/widgets/status_badge.dart`
- `lib/frontend/ui/widgets/role_guard.dart`
- `lib/frontend/ui/screens/admin/`

**Teknik Konstruksi:**

| Teknik                           | Implementasi                                                           |
| -------------------------------- | ---------------------------------------------------------------------- |
| ✅ **Table-driven Construction** | Map role → permission, Map status → config UI, List route definition   |
| ✅ **Defensive Programming**     | Validasi role tidak null/tidak dikenal sebelum lookup permission tabel |

**Contoh Table-driven RBAC:**

```dart
const Map<String, List<String>> rolePermissions = {
  'super_admin':    ['read', 'write', 'delete', 'validate', 'grant_access'],
  'admin_lapangan': ['read', 'write', 'upload_photo'],
  'kontraktor':     ['read'],
  'client':         ['read'],
  'aph':            ['read'], // hanya setelah izin super_admin
};
```

---

### 🟡 Pasangan 3 — Database SQLite, Repository & Models

**Modul yang dikerjakan:**

- `lib/backend/database/app_database.dart` + `tables/`
- `lib/backend/models/` (user, project, report, task, db_result)
- `lib/backend/repositories/base_repository.dart`
- `lib/backend/repositories/project_repository.dart`
- `lib/backend/repositories/report_repository.dart`
- `lib/backend/repositories/user_repository.dart`
- `test/unit/backend/models/`
- `test/unit/backend/repositories/`
- `test/performance/db_insert_perf_test.dart`
- `test/performance/db_query_perf_test.dart`
- `test/performance/db_update_perf_test.dart`

**Teknik Konstruksi:**

| Teknik                             | Implementasi                                                                  |
| ---------------------------------- | ----------------------------------------------------------------------------- |
| ✅ **Parameterization / Generics** | `BaseRepository<T>` generik — diextend oleh semua repository                  |
| ✅ **Defensive Programming**       | Validasi field wajib di constructor model + precondition sebelum query SQLite |

**Contoh BaseRepository Generic:**

```dart
abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  Future<T?> getById(int id);
  Future<int> add(T item);
  Future<bool> update(int id, T item);
  Future<bool> delete(int id);
}
```

---

### 🟠 Anggota 5 — Services (API), Config & Reusable Widgets

**Modul yang dikerjakan:**

- `lib/backend/config/app_config.dart`
- `lib/backend/services/auth_service.dart`
- `lib/backend/services/storage_service.dart`
- `lib/backend/services/notification_service.dart`
- `lib/backend/services/pdf_service.dart`
- `lib/frontend/ui/widgets/project_card.dart`
- `lib/frontend/ui/widgets/progress_chart.dart`
- `lib/frontend/ui/widgets/s_curve_chart.dart`
- `.env.development` & `.env.production`

**Teknik Konstruksi:**

| Teknik                       | Implementasi                                                               |
| ---------------------------- | -------------------------------------------------------------------------- |
| ✅ **API**                   | Integrasi Firebase Auth, Storage, FCM — semua call ke layanan eksternal    |
| ✅ **Runtime Configuration** | Load env (dev/prod) dari `.env` saat startup via `flutter_dotenv`          |
| ✅ **Code Reuse**            | Reusable chart widget & PDF service dipanggil dari berbagai screen         |
| ✅ **Defensive Programming** | Validasi response tidak null, handle exception dari Firebase & PDF library |

> 💡 Pilih **2 dari 3 teknik** di atas sesuai kesepakatan kelompok (API wajib dipilih).

---

## 📋 Ringkasan Pembagian Teknik Konstruksi

| Pasangan/Anggota | Modul Utama                     | Teknik 1         | Teknik 2                    | Defensive |
| ---------------- | ------------------------------- | ---------------- | --------------------------- | --------- |
| Pasangan 1       | Auth + Upload + Report FSM      | Automata         | —                           | ✅ Wajib  |
| Pasangan 2       | RBAC + Routing + Utils          | Table-driven     | —                           | ✅ Wajib  |
| Pasangan 3       | SQLite DB + Repository + Models | Parameterization | —                           | ✅ Wajib  |
| Anggota 5        | Services + Config + Widgets     | API              | Runtime Config / Code Reuse | ✅ Wajib  |

---

## 🧪 Unit Testing

Unit testing dilakukan menggunakan **`flutter_test`** — package bawaan Flutter SDK, tanpa instalasi tambahan. Library **`mockito`** digunakan untuk membuat mock dependency (repository, service) agar setiap unit dapat diuji secara terisolasi tanpa bergantung pada database asli atau layanan Firebase.

### Ruang Lingkup Unit Testing

| Modul yang Ditest | File Test                         | Yang Diverifikasi                                  |
| ----------------- | --------------------------------- | -------------------------------------------------- |
| Model validasi    | `test/unit/backend/models/`       | Null check, format data, konstruktor defensif      |
| Repository CRUD   | `test/unit/backend/repositories/` | Insert, select, update, delete ke SQLite in-memory |
| FSM Providers     | `test/unit/frontend/providers/`   | Transisi state valid & invalid pada Automata       |

### Cara Menjalankan Unit Test

```bash
# Jalankan semua unit test
flutter test

# Jalankan satu file test spesifik
flutter test test/unit/backend/repositories/report_repository_test.dart

# Jalankan dengan coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

### Contoh Struktur Unit Test

```dart
// test/unit/backend/repositories/report_repository_test.dart
void main() {
  late AppDatabase db;
  late ReportRepository repo;

  setUp(() {
    // Gunakan SQLite in-memory agar test tidak menulis ke disk
    db = AppDatabase(NativeDatabase.memory());
    repo = ReportRepository(db);
  });

  tearDown(() async => await db.close());

  test('add() harus mengembalikan id lebih dari 0', () async {
    final id = await repo.add(ReportModel(title: 'Laporan Test', progress: 50));
    expect(id, greaterThan(0));
  });

  test('getById() harus null jika id tidak ditemukan', () async {
    final result = await repo.getById(999);
    expect(result, isNull);
  });

  test('delete() harus mengembalikan true jika berhasil', () async {
    final id = await repo.add(ReportModel(title: 'Laporan Hapus', progress: 10));
    final deleted = await repo.delete(id);
    expect(deleted, isTrue);
  });
}
```

---

## ⚡ Performance Testing

Performance testing dilakukan menggunakan **`flutter_test`** dengan **`Stopwatch`** bawaan Dart untuk mengukur durasi eksekusi operasi database SQLite. Testing difokuskan pada operasi yang paling sering digunakan dan berpotensi menjadi bottleneck performa.

### Skenario & Jumlah Percobaan

| Skenario                              | File Test                  | Jumlah Run | Target Waktu |
| ------------------------------------- | -------------------------- | ---------- | ------------ |
| Bulk INSERT 100 laporan harian        | `db_insert_perf_test.dart` | **5 kali** | < 500 ms     |
| SELECT + filter berdasarkan ID proyek | `db_query_perf_test.dart`  | **5 kali** | < 100 ms     |
| UPDATE status laporan (batch 50 data) | `db_update_perf_test.dart` | **5 kali** | < 300 ms     |

> Setiap skenario dijalankan **5 kali** dan diambil rata-ratanya. Database di-reset ke kondisi bersih (SQLite in-memory) setiap sebelum run baru untuk memastikan konsistensi hasil.

### Cara Menjalankan Performance Test

```bash
# Jalankan semua performance test sekaligus
flutter test test/performance/

# Jalankan satu skenario spesifik
flutter test test/performance/db_query_perf_test.dart
```

### Contoh Implementasi Performance Test

```dart
// test/performance/db_insert_perf_test.dart
void main() {
  late AppDatabase db;
  late ReportRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = ReportRepository(db);
  });

  tearDown(() async => await db.close());

  test('INSERT 100 laporan — rata-rata dari 5 run', () async {
    final List<int> durations = [];

    for (int run = 1; run <= 5; run++) {
      // Reset database setiap run
      await db.delete(db.reports).go();

      final stopwatch = Stopwatch()..start();
      for (int i = 0; i < 100; i++) {
        await repo.add(ReportModel(title: 'Laporan $i', progress: i % 100));
      }
      stopwatch.stop();

      durations.add(stopwatch.elapsedMilliseconds);
      print('Run $run: ${stopwatch.elapsedMilliseconds} ms');
    }

    final avg = durations.reduce((a, b) => a + b) / durations.length;
    print('Rata-rata 5 run: ${avg.toStringAsFixed(1)} ms');

    // Assertion: rata-rata harus di bawah target
    expect(avg, lessThan(500),
        reason: 'Rata-rata INSERT 100 data harus < 500ms');
  });
}
```

---

## 🛡️ Defensive Programming

Seluruh anggota kelompok wajib menerapkan **Defensive Programming / Design by Contract (DbC)** pada modul yang masing-masing dikerjakan. Prinsip utama yang diterapkan:

### 1. Precondition — Validasi Input Sebelum Diproses

Setiap fungsi memvalidasi argumennya sebelum menjalankan logika inti. Jika tidak memenuhi syarat, langsung lempar exception.

```dart
// backend/repositories/report_repository.dart
Future<int> add(ReportModel report) {
  // PRECONDITION: judul tidak boleh kosong
  assert(report.title.isNotEmpty, 'Judul laporan tidak boleh kosong');
  // PRECONDITION: progress harus antara 0 dan 100
  assert(report.progress >= 0 && report.progress <= 100,
      'Progress harus bernilai antara 0 dan 100');
  return _db.into(_db.reports).insert(report.toCompanion());
}
```

### 2. Postcondition — Verifikasi Hasil Setelah Eksekusi

Setelah operasi selesai, verifikasi bahwa hasilnya sesuai ekspektasi sebelum dikembalikan ke pemanggil.

```dart
Future<int> add(ReportModel report) async {
  final id = await _db.into(_db.reports).insert(report.toCompanion());
  // POSTCONDITION: id yang dikembalikan harus valid (> 0)
  assert(id > 0, 'Insert gagal — id tidak valid: $id');
  return id;
}
```

### 3. Null Safety & Invariant di Constructor Model

```dart
// backend/models/report_model.dart
class ReportModel {
  final String title;
  final int progress;
  final DateTime createdAt;

  ReportModel({
    required this.title,
    required this.progress,
    required this.createdAt,
  })  : assert(title.isNotEmpty, 'Title tidak boleh kosong'),
        assert(progress >= 0 && progress <= 100, 'Progress harus 0–100'),
        assert(!createdAt.isAfter(DateTime.now()), 'Tanggal tidak boleh di masa depan');
}
```

### 4. Validasi Input Form (Frontend)

```dart
// frontend/utils/validators.dart
class Validators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) return 'Judul tidak boleh kosong';
    if (value.length > 200) return 'Judul maksimal 200 karakter';
    return null;
  }

  static String? validateProgress(String? value) {
    final parsed = int.tryParse(value ?? '');
    if (parsed == null) return 'Harus berupa angka';
    if (parsed < 0 || parsed > 100) return 'Progress harus antara 0 dan 100';
    return null;
  }
}
```

### 5. Guard State Transition (Automata)

```dart
// frontend/providers/report_provider.dart
void submit() {
  // PRECONDITION: hanya bisa submit dari state DRAFT
  assert(state == ReportState.draft,
      'submit() hanya valid dari state DRAFT, saat ini: $state');
  state = ReportState.submitted;
}

void approve() {
  // PRECONDITION: hanya bisa approve dari state SUBMITTED
  assert(state == ReportState.submitted,
      'approve() hanya valid dari state SUBMITTED, saat ini: $state');
  state = ReportState.approved;
}
```

---

## ✅ Checklist CLO2 per Anggota

- [ ] Branch individu di GitHub + commit ke `main/master`
- [ ] Unit testing pada modul yang dikerjakan (`flutter_test` + `mockito`)
- [ ] Performance testing — 5 run per skenario dengan `Stopwatch`, tampilkan rata-rata
- [ ] Implementasi Defensive Programming (precondition, postcondition, invariant di constructor)
- [ ] Implementasi teknik konstruksi ke-1 (sesuai tabel pembagian)
- [ ] Implementasi teknik konstruksi ke-2 (sesuai tabel pembagian)

---

## 📦 Setup & Instalasi

```bash
# Clone repository
git clone https://github.com/<org>/cv-tata-saka-consultant.git
cd cv-tata-saka-consultant

# Install dependencies
flutter pub get

# Generate kode Drift (WAJIB setelah clone / setiap perubahan skema database)
dart run build_runner build --delete-conflicting-outputs

# Salin file environment
cp .env.development .env

# Jalankan di web (development)
flutter run -d chrome

# Build PWA (production)
flutter build web --release
```

> ⚠️ **File yang tidak di-push ke GitHub:** `android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`, `.env.production`
> Minta file-file ini ke anggota yang setup Firebase/environment.

---

_Dikembangkan sebagai Tugas Besar CLO2 Konstruksi Perangkat Lunak — Telkom University 2025/2026_
