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
| Provider                    | 6.x    | State management                                        |
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

| Teknologi            | Kegunaan                                                    |
| -------------------- | ----------------------------------------------------------- |
| **Supabase Database**| Database PostgreSQL utama — penyimpanan awan relasional      |
| **Supabase Auth**    | Autentikasi pengguna (register, login, logout)              |
| **Supabase Storage** | Penyimpanan foto dokumentasi lapangan                       |

> 💡 **Mengapa Supabase?** Supabase adalah alternatif Firebase open-source yang menyediakan basis data PostgreSQL real-time, autentikasi instan, dan storage file dalam satu ekosistem backend terpadu dengan integrasi Flutter yang sangat mudah.

### Data & Tools

| Tools                 | Kegunaan                                       |
| --------------------- | ---------------------------------------------- |
| Git + GitHub          | Version control & kolaborasi                   |
| VS Code + Flutter SDK | IDE utama                                      |
| GitHub Actions        | CI/CD pipeline otomatis                        |
| Supabase Dashboard    | Inspeksi & kelola database PostgreSQL visual   |
| .env (dev & prod)     | Konfigurasi environment runtime                |

---

## 📁 Project Structure

> 📌 Proyek ini adalah **satu Flutter project** dengan pemisahan logis di dalam `lib/`:
>
> - `lib/backend/` → semua kode yang **bersentuhan dengan database Supabase & layanan eksternal**
> - `lib/frontend/` → semua kode **pure UI** (screens, widgets, providers, routing, utils)

```
CV.TATA SAKA CONSULTANT/
├── lib/
│   │
│   ├── backend/                                    # 🔴 BACKEND – database, model, service
│   │   │
│   │   ├── config/
│   │   │   └── app_config.dart                    # RUNTIME CONFIG – load .env dev/prod
│   │   │
│   │   ├── supabase/
│   │   │   └── supabase_client.dart               # SUPABASE – inisialisasi Supabase client
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
│   │   │   ├── auth_service.dart                  # API – Supabase Authentication
│   │   │   ├── storage_service.dart               # API – Supabase Storage (upload/download foto)
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

| **Automata**         | `frontend/providers/auth_provider.dart`      | FSM: `unauthenticated → loading → authenticated → error`                                 |
│ | **Automata**         | `frontend/providers/project_provider.dart`   | FSM: `initial → loading → loaded → error`                                                |
│ | **Automata**         | `frontend/providers/report_provider.dart`    | FSM: `initial → loading → loaded → error`                                                |
│ | **Table-driven**     | `backend/constants/role_permissions.dart`    | `Map<String, List<String>>` role → daftar aksi yang diizinkan                            |
│ | **Table-driven**     | `frontend/core/constants/status_config.dart` | `Map<String, StatusConfig>` status → warna, label, icon                                  |
│ | **Table-driven**     | `frontend/core/router/app_router.dart`       | List definisi route + required role (go_router)                                          |
│ | **Parameterization** | `backend/repositories/base_repository.dart`  | `abstract class BaseRepository<T>` dengan method generik                                 |
│ | **Parameterization** | `backend/models/db_result.dart`              | `class DbResult<T>` wrapper response success/error dari database                         |
│ | **Runtime Config**   | `backend/config/app_config.dart`             | Load `.env.development` / `.env.production` saat startup                                 |
│ | **Code Reuse**       | `frontend/ui/widgets/`                       | Widget `progress_chart`, `s_curve_chart`, `photo_upload_widget` dipakai di banyak screen |
│ | **Code Reuse**       | `backend/services/pdf_service.dart`          | Library PDF generation dipanggil dari berbagai modul                                     |
│ | **API**              | `backend/services/auth_service.dart`         | Integrasi Supabase Authentication SDK                                                    |
│ | **API**              | `backend/services/storage_service.dart`      | Integrasi Supabase Storage — upload/download foto                                        |
│ | **Defensive**        | `backend/models/*.dart`                      | Validasi tipe data & null check di setiap constructor model                              |
│ | **Defensive**        | `frontend/utils/validators.dart`             | Validasi input form sebelum disimpan ke database                                         |

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

Performance testing dilakukan menggunakan **`flutter_test`** dengan **`Stopwatch`** bawaan Dart untuk mengukur efisiensi durasi eksekusi data parsing dan algoritma penyaringan (filtering) data lokal dalam jumlah besar.

### Skenario & Jumlah Percobaan

| Skenario                              | File Test                  | Jumlah Run | Target Waktu |
| ------------------------------------- | -------------------------- | ---------- | ------------ |
| Bulk JSON parsing (1000 item)         | `performance_test.dart`    | **1 kali** | < 100 ms     |
| Searching & Filtering (5000 item)     | `performance_test.dart`    | **1 kali** | < 50 ms      |

### Cara Menjalankan Performance Test

```bash
# Jalankan file performance test
flutter test test/performance_test.dart
```

### Contoh Implementasi Performance Test

```dart
// test/performance_test.dart
void main() {
  group('Performance Benchmark - Model Parsing and Filtering', () {
    test('Mengukur kecepatan parse 1000 JSON ke ProjectModel', () {
      final List<Map<String, dynamic>> rawJsonList = List.generate(1000, (index) => ...);

      final stopwatch = Stopwatch()..start();
      final List<ProjectModel> projects = rawJsonList.map((json) => ProjectModel.fromJson(json)).toList();
      stopwatch.stop();

      print('Waktu eksekusi parse 1000 data: ${stopwatch.elapsedMilliseconds} ms');
      
      expect(stopwatch.elapsedMilliseconds, lessThan(100));
    });
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

---

## 🔍 Detail Implementasi Riil Teknik Automata & Table-Driven Construction

Berikut adalah berkas-berkas di dalam proyek ini yang secara aktif mengimplementasikan logika program menggunakan kedua teknik tersebut (bukan sekadar komentar/spesifikasi):

### 1. Table-Driven Construction
Teknik ini menghindari penggunaan percabangan logika berkondisi (`if-else` atau `switch-case` yang panjang) dengan mengambil nilai langsung dari pemetaan tabel data terstruktur (`List` atau `Map`).

* **[create_supervision_report_page.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/ui/pages/create_supervision_report_page.dart)** (Fungsi pembantu `_monthName`):
  Menggunakan list konstan `names` untuk memetakan nomor bulan (`int`) langsung ke nama bulannya lewat indeks `names[m - 1]`. Hal ini menghindari penggunaan 12 kondisi `if-else` secara beruntun.
* **[confirmation_request_page.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/ui/pages/confirmation_request_page.dart)** (Getter `_items`):
  Menggunakan representasi data di dalam `List<Map<String, String>>` untuk menyimpan pemetaan badge visual seperti `badgeColor`, `badgeTextColor`, judul proyek, dan parameter UI lainnya berdasarkan status. Data ini langsung dipetakan oleh widget pembangun tanpa percabangan logika render.
* **Model Serialization (`fromJson` / `toJson`)**:
  Model data di dalam `lib/backend/models/` menggunakan pemetaan map-to-object untuk parsing data JSON dari query Supabase secara terstruktur.

### 2. Automata (State Transitions / Finite State Machine)
Teknik ini memodelkan program sebagai sekumpulan keadaan (states) terdefinisi, di mana perpindahan antar keadaan diatur menggunakan transisi yang valid untuk menghindari "illegal state".

* **[splash_page.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/ui/pages/splash_page.dart)** (State transition berbasis waktu):
  Menggunakan `Timer` pada `initState` untuk memicu transisi state waktu (timer transition) dari keadaan awal **Splash Screen** ke halaman berikutnya (**Login Screen**) setelah durasi 3 detik secara teratur menggunakan transisi sekali jalan (`pushReplacement`).
* **[auth_provider.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/providers/auth_provider.dart)** (FSM Autentikasi Pengawas):
  Mengelola transisi status keamanan (`unauthenticated` $\rightarrow$ `loading` $\rightarrow$ `authenticated` / `error`) lengkap dengan validasi transisi asersi defensif (`assert`).
* **[report_provider.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/providers/report_provider.dart)** & **[project_provider.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/providers/project_provider.dart)** (FSM Load/Fetch Data):
  Kedua berkas menggunakan enum state (`initial`, `loading`, `loaded`, `error`) untuk merepresentasikan transisi status penarikan data dari backend Supabase.

---

## ✨ Penerapan Prinsip Clean Code

Proyek ini menerapkan beberapa prinsip **Clean Code** untuk menjaga kualitas, keterbacaan, dan kemudahan pemeliharaan kode:

### 1. Meaningful Names (Penamaan yang Jelas & Bermakna)
Menghindari penggunaan singkatan yang membingungkan atau variabel satu huruf. Penamaan kelas dan variabel ditulis secara deskriptif untuk memperjelas fungsinya langsung dari namanya.
* Contoh: Kelas `CreateSupervisionReportPage` dan variabel-variabel pendukung seperti `_selectedProject`, `_selectedDate`, dan `_activityController`.

### 2. Single Responsibility Principle / SRP (Satu Tanggung Jawab)
Membagi sistem ke dalam bagian-bagian kecil yang hanya memiliki satu tanggung jawab utama.
* Contoh: Pemisahan arsitektur folder yang tegas antara `lib/backend` (fokus pada data & persistence SQLite) dan `lib/frontend` (fokus pada antarmuka visual UI).
* Contoh: Fungsi pembantu `_monthName(int m)` di [create_supervision_report_page.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/ui/pages/create_supervision_report_page.dart) diisolasi khusus untuk konversi nama bulan sehingga tidak mengotori fungsi rendering UI utama.

### 3. Avoid Deep Nesting (Menghindari Percabangan Bertingkat yang Rumit)
Mengganti struktur percabangan `if-else` atau `switch-case` berjenjang menggunakan pemetaan terstruktur (seperti teknik *Table-Driven*).
* Contoh: Pemetaan nama bulan langsung menggunakan pencarian berbasis indeks array `names[m - 1]` di fungsi `_monthName`.

### 4. Don't Repeat Yourself / DRY (Menghindari Duplikasi Kode)
Membungkus blok kode visual atau logika yang sering digunakan kembali menjadi komponen terpisah (*Helper Widgets*).
* Contoh: Fungsi `_buildProgressBar(...)` dan `_buildProjectCard(...)` di berkas [project_list_page.dart](file:///c:/Users/LENOVO/Documents/MataKuliah/Semester%204/Konstruksi%20Perangkat%20Lunak/Tubes/belajar/Aplikasi_Monitoring_Proyek_Konsultan/lib/Frontend/ui/pages/project_list_page.dart) digunakan berulang kali untuk merender statistik proyek yang berbeda tanpa menduplikasi struktur widget dasar.

### 5. Penggunaan Sintaks Modern Dart yang Ringkas
Menggunakan ekspresi lambda/arrow function (`=>`) untuk mempersingkat fungsi sederhana serta *Spread Operator* (`...`) untuk penggabungan list widget dinamis secara elegan.


