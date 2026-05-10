# 🏗️ CV. TATA SAKA CONSULTANT — Sistem Informasi Pengelolaan Laporan Proyek

> Aplikasi Sistem Informasi CV. TATA SAKA CONSULTANT untuk mentracking kinerja proyek secara detail, real-time, dan terpusat — berbasis Flutter Web (PWA) & Firebase.

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

## 🚀 Tech Stack

### Frontend

| Teknologi                   | Versi  | Kegunaan                                             |
| --------------------------- | ------ | ---------------------------------------------------- |
| Flutter                     | 3.x    | Framework utama untuk membuat PWA                    |
| Riverpod                    | 2.x    | State management                                     |
| FL Chart                    | latest | Grafik untuk tracking progress proyek (Kurva S)      |
| Lucide Icons                | latest | Library icon UI                                      |
| go_router                   | latest | Declarative routing berbasis tabel konfigurasi       |
| freezed + json_serializable | latest | Immutable model & code generation (Parameterization) |
| flutter_dotenv              | latest | Runtime environment config (dev/prod)                |
| image_picker                | latest | Ambil foto langsung dari kamera/galeri lapangan      |
| cached_network_image        | latest | Cache foto lapangan dari Firebase Storage            |
| pdf + printing              | latest | Export laporan harian ke format PDF                  |
| flutter_test + mockito      | latest | Unit testing & performance testing                   |

### Backend

| Teknologi                | Kegunaan                                 |
| ------------------------ | ---------------------------------------- |
| Firebase Firestore       | Database utama (real-time NoSQL)         |
| Firebase Authentication  | Autentikasi pengguna (register & login)  |
| Firebase Storage         | Penyimpanan foto dokumentasi lapangan    |
| Firebase Cloud Messaging | Notifikasi real-time ke pengawas & admin |
| Firebase Security Rules  | Implementasi RBAC di level backend       |

### Data & Tools

| Tools                 | Kegunaan                        |
| --------------------- | ------------------------------- |
| Git + GitHub          | Version control & kolaborasi    |
| VS Code + Flutter SDK | IDE utama                       |
| GitHub Actions        | CI/CD pipeline otomatis         |
| .env (dev & prod)     | Konfigurasi environment runtime |

---

## 📁 Project Structure

```
CV.TATA SAKA CONSULTANT/
├── frontend/
│   ├── lib/
│   │   │
│   │   ├── core/
│   │   │   ├── config/
│   │   │   │   ├── app_config.dart           # RUNTIME CONFIG – load .env dev/prod
│   │   │   │   └── firebase_options.dart     # RUNTIME CONFIG – generated Firebase config
│   │   │   ├── constants/
│   │   │   │   ├── app_constants.dart        # Konstanta global aplikasi
│   │   │   │   ├── role_permissions.dart     # TABLE-DRIVEN – Map role → allowed actions
│   │   │   │   └── status_config.dart        # TABLE-DRIVEN – Map status → warna/label/icon
│   │   │   ├── router/
│   │   │   │   └── app_router.dart           # TABLE-DRIVEN – route definition table (go_router)
│   │   │   └── theme/
│   │   │       └── app_theme.dart            # Warna brand & tema global
│   │   │
│   │   ├── models/                           # DEFENSIVE – validasi ketat di constructor
│   │   │   ├── user_model.dart               # Model pengguna + role
│   │   │   ├── project_model.dart            # Model paket proyek
│   │   │   ├── report_model.dart             # Model laporan harian
│   │   │   └── task_model.dart               # Model item pekerjaan
│   │   │
│   │   ├── repositories/
│   │   │   ├── base_repository.dart          # PARAMETERIZATION – abstract BaseRepo<T>
│   │   │   ├── project_repository.dart       # extends BaseRepository<ProjectModel>
│   │   │   ├── report_repository.dart        # extends BaseRepository<ReportModel>
│   │   │   └── user_repository.dart          # extends BaseRepository<UserModel>
│   │   │
│   │   ├── services/                         # API – integrasi Firebase & layanan eksternal
│   │   │   ├── auth_service.dart             # API – Firebase Authentication
│   │   │   ├── firestore_service.dart        # API – Firebase Firestore (CRUD)
│   │   │   ├── storage_service.dart          # API – Firebase Storage (upload foto)
│   │   │   ├── notification_service.dart     # API – Firebase Cloud Messaging (FCM)
│   │   │   └── pdf_service.dart              # CODE REUSE – generate & print PDF laporan
│   │   │
│   │   ├── providers/
│   │   │   ├── auth_provider.dart            # AUTOMATA – FSM: unauthenticated→loading→authenticated→error
│   │   │   ├── report_provider.dart          # AUTOMATA – FSM: draft→submitted→reviewed→approved/rejected
│   │   │   ├── upload_provider.dart          # AUTOMATA – FSM: idle→picking→uploading→success/failed
│   │   │   └── project_provider.dart         # State management proyek aktif
│   │   │
│   │   ├── ui/
│   │   │   ├── screens/
│   │   │   │   ├── auth/
│   │   │   │   │   ├── login_page.dart
│   │   │   │   │   └── reset_password_page.dart
│   │   │   │   ├── dashboard/
│   │   │   │   │   └── dashboard_page.dart   # Overview semua proyek + chart
│   │   │   │   ├── project/
│   │   │   │   │   ├── project_list_page.dart
│   │   │   │   │   └── project_detail_page.dart
│   │   │   │   ├── report/
│   │   │   │   │   ├── report_form_page.dart  # Input laporan harian dari lapangan
│   │   │   │   │   ├── report_list_page.dart
│   │   │   │   │   └── report_detail_page.dart
│   │   │   │   └── admin/
│   │   │   │       ├── user_management_page.dart
│   │   │   │       └── access_control_page.dart  # Kelola izin akses APH/eksternal
│   │   │   │
│   │   │   └── widgets/                      # CODE REUSE – komponen kecil reusable
│   │   │       ├── project_card.dart          # Card ringkasan paket proyek
│   │   │       ├── progress_chart.dart        # Wrapper FL Chart – progress bar
│   │   │       ├── s_curve_chart.dart         # Kurva S proyek
│   │   │       ├── status_badge.dart          # Badge status (TABLE-DRIVEN status_config)
│   │   │       ├── role_guard.dart            # Widget guard akses (TABLE-DRIVEN role_permissions)
│   │   │       └── photo_upload_widget.dart   # Komponen upload foto lapangan
│   │   │
│   │   ├── utils/
│   │   │   ├── validators.dart               # DEFENSIVE – validasi input form
│   │   │   ├── date_formatter.dart           # Utility format tanggal
│   │   │   └── permission_checker.dart       # TABLE-DRIVEN – lookup role → akses halaman
│   │   │
│   │   ├── app.dart
│   │   └── main.dart
│   │
│   ├── test/
│   │   ├── unit/
│   │   │   ├── models/                       # Unit test validasi model
│   │   │   ├── repositories/                 # Unit test CRUD repository
│   │   │   └── providers/                    # Unit test FSM state/automata
│   │   └── performance/
│   │       └── firestore_perf_test.dart      # Performance test Firestore query
│   │
│   ├── web/
│   │   ├── index.html                        # PWA Metadata
│   │   └── manifest.json
│   │
│   ├── .env.development                      # RUNTIME CONFIG – env development
│   ├── .env.production                       # RUNTIME CONFIG – env production
│   └── pubspec.yaml
│
├── .github/
│   └── workflows/
│       └── ci.yml                            # GitHub Actions CI/CD
└── analysis_options.yaml
```

---

## 🎯 Teknik Konstruksi CLO2

> **Wajib semua anggota:** Defensive Programming / Design by Contract (DbC)  
> **Per individu:** 2 teknik dari daftar berikut (maks. 2 orang per teknik dalam 1 kelompok)

### Ringkasan Teknik per Fitur

| Teknik               | File / Modul                | Deskripsi Implementasi                                                                     |
| -------------------- | --------------------------- | ------------------------------------------------------------------------------------------ |
| **Automata**         | `auth_provider.dart`        | FSM state: `unauthenticated → loading → authenticated → error`                             |
| **Automata**         | `report_provider.dart`      | FSM state: `draft → submitted → reviewed → approved / rejected`                            |
| **Automata**         | `upload_provider.dart`      | FSM state: `idle → picking → uploading → success / failed`                                 |
| **Table-driven**     | `role_permissions.dart`     | `Map<String, List<String>>` role → daftar aksi yang diizinkan                              |
| **Table-driven**     | `status_config.dart`        | `Map<String, StatusConfig>` status → warna, label, icon                                    |
| **Table-driven**     | `app_router.dart`           | List definisi route + required role (go_router)                                            |
| **Parameterization** | `base_repository.dart`      | `abstract class BaseRepository<T>` dengan method generik                                   |
| **Parameterization** | `api_result.dart`           | `class ApiResult<T>` wrapper response success/error                                        |
| **Runtime Config**   | `app_config.dart`           | Load `.env.development` / `.env.production` saat startup                                   |
| **Code Reuse**       | `widgets/`                  | Komponen `progress_chart`, `s_curve_chart`, `photo_upload_widget` dipakai di banyak screen |
| **Code Reuse**       | `pdf_service.dart`          | Library PDF generation dipanggil dari berbagai modul                                       |
| **API**              | `auth_service.dart`         | Integrasi Firebase Auth SDK                                                                |
| **API**              | `storage_service.dart`      | Integrasi Firebase Storage — upload/download foto lapangan                                 |
| **API**              | `notification_service.dart` | Integrasi FCM — push notification ke pengguna                                              |
| **Defensive**        | `models/*.dart`             | Validasi tipe data & nilai null di setiap constructor model                                |
| **Defensive**        | `utils/validators.dart`     | Validasi input form sebelum dikirim ke Firestore                                           |

---

## 👥 Pembagian Tugas

> Pembagian dilakukan per pasangan. Setiap anggota menerapkan **Defensive Programming (wajib)** + **2 teknik konstruksi pilihan** sesuai modul yang dikerjakan.

---

### 🔵 Pasangan 1 — Authentication & Upload Flow

**Modul yang dikerjakan:**

- `lib/providers/auth_provider.dart`
- `lib/providers/upload_provider.dart`
- `lib/providers/report_provider.dart`
- `lib/ui/screens/auth/` (login, reset password)
- `lib/ui/widgets/photo_upload_widget.dart`
- `test/unit/providers/`

**Teknik Konstruksi:**

| Teknik                       | Implementasi                                                                     |
| ---------------------------- | -------------------------------------------------------------------------------- |
| ✅ **Automata**              | FSM untuk alur autentikasi, upload foto, dan workflow laporan (draft → approved) |
| ✅ **Defensive Programming** | Validasi state transition — mencegah state invalid pada FSM                      |

**Contoh FSM Report Workflow:**

```
[DRAFT] --submit--> [SUBMITTED] --review--> [APPROVED]
                                     \-----> [REJECTED] --revise--> [DRAFT]
```

---

### 🟢 Pasangan 2 — RBAC, Routing & Utils

**Modul yang dikerjakan:**

- `lib/core/constants/role_permissions.dart`
- `lib/core/constants/status_config.dart`
- `lib/core/router/app_router.dart`
- `lib/utils/permission_checker.dart`
- `lib/ui/widgets/status_badge.dart`
- `lib/ui/widgets/role_guard.dart`
- `lib/ui/screens/admin/`

**Teknik Konstruksi:**

| Teknik                           | Implementasi                                                         |
| -------------------------------- | -------------------------------------------------------------------- |
| ✅ **Table-driven Construction** | Map role → permission, Map status → config UI, List route definition |
| ✅ **Defensive Programming**     | Validasi role tidak null/tidak dikenal sebelum lookup permission     |

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

### 🟡 Pasangan 3 — Repository, Models & Services

**Modul yang dikerjakan:**

- `lib/models/` (user, project, report, task)
- `lib/repositories/base_repository.dart`
- `lib/repositories/project_repository.dart`
- `lib/repositories/report_repository.dart`
- `lib/repositories/user_repository.dart`
- `lib/services/firestore_service.dart`
- `test/unit/models/`
- `test/unit/repositories/`
- `test/performance/firestore_perf_test.dart`

**Teknik Konstruksi:**

| Teknik                             | Implementasi                                                         |
| ---------------------------------- | -------------------------------------------------------------------- |
| ✅ **Parameterization / Generics** | `BaseRepository<T>` generik — diextend oleh semua repository         |
| ✅ **Defensive Programming**       | Validasi field wajib di constructor model (null check, format check) |

**Contoh BaseRepository Generic:**

```dart
abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  Future<T?> getById(String id);
  Future<void> add(T item);
  Future<void> update(String id, T item);
  Future<void> delete(String id);
}
```

---

### 🟠 Anggota 5 — Services (API), Config & Reusable Widgets

**Modul yang dikerjakan:**

- `lib/core/config/app_config.dart`
- `lib/services/auth_service.dart`
- `lib/services/storage_service.dart`
- `lib/services/notification_service.dart`
- `lib/services/pdf_service.dart`
- `lib/ui/widgets/project_card.dart`
- `lib/ui/widgets/progress_chart.dart`
- `lib/ui/widgets/s_curve_chart.dart`
- `.env.development` & `.env.production`

**Teknik Konstruksi:**

| Teknik                       | Implementasi                                                                |
| ---------------------------- | --------------------------------------------------------------------------- |
| ✅ **API**                   | Integrasi Firebase Auth, Storage, FCM — semua service call ke API eksternal |
| ✅ **Runtime Configuration** | Load environment (dev/prod) dari `.env` saat startup via `flutter_dotenv`   |
| ✅ **Code Reuse**            | Reusable widget chart & PDF service dipakai di banyak screen                |
| ✅ **Defensive Programming** | Validasi response API tidak null, handle error dari Firebase                |

> 💡 _Anggota 5 boleh memilih **2 dari 3 teknik** di atas (API + Runtime Config, atau API + Code Reuse) sesuai kesepakatan kelompok._

---

## 📋 Ringkasan Pembagian Teknik Konstruksi

| Pasangan   | Modul Utama                   | Teknik 1         | Teknik 2                    | Defensive |
| ---------- | ----------------------------- | ---------------- | --------------------------- | --------- |
| Pasangan 1 | Auth + Upload + Report FSM    | Automata         | —                           | ✅ Wajib  |
| Pasangan 2 | RBAC + Routing + Utils        | Table-driven     | —                           | ✅ Wajib  |
| Pasangan 3 | Repository + Models + Testing | Parameterization | —                           | ✅ Wajib  |
| Anggota 5  | Services + Config + Widgets   | API              | Runtime Config / Code Reuse | ✅ Wajib  |

---

## ✅ Checklist CLO2 per Anggota

- [ ] Branch individu di GitHub + commit ke `main/master`
- [ ] Unit testing pada modul yang dikerjakan
- [ ] Performance testing pada bagian kode yang dibuat
- [ ] Implementasi Defensive Programming / Design by Contract
- [ ] Implementasi teknik konstruksi ke-1 (sesuai tabel di atas)
- [ ] Implementasi teknik konstruksi ke-2 (sesuai tabel di atas)

---

## 📦 Setup & Instalasi

```bash
# Clone repository
git clone https://github.com/<org>/cv-tata-saka-consultant.git
cd cv-tata-saka-consultant/frontend

# Install dependencies
flutter pub get

# Salin file environment
cp .env.development .env

# Jalankan di web (development)
flutter run -d chrome

# Build PWA (production)
flutter build web --release
```

---

_Dikembangkan sebagai Tugas Besar CLO2 Konstruksi Perangkat Lunak — Telkom University 2025/2026_
