# ==============================================================
# fill_comments.ps1
# Jalankan dari ROOT folder project Flutter kamu di terminal VS Code:
#   .\fill_comments.ps1
# Script ini mengisi file-file baru dengan komentar instruksi.
# File yang sudah ada isinya TIDAK akan ditimpa.
# ==============================================================

function Write-IfEmpty {
    param([string]$Path, [string]$Content)
    if (-not (Test-Path $Path)) {
        Write-Host "SKIP (tidak ditemukan): $Path" -ForegroundColor Red
        return
    }
    $existing = Get-Content $Path -Raw
    if ($existing -and $existing.Trim().Length -gt 0) {
        Write-Host "SKIP (sudah ada isi): $Path" -ForegroundColor Yellow
    } else {
        Set-Content -Path $Path -Value $Content -Encoding UTF8
        Write-Host "OK: $Path" -ForegroundColor Green
    }
}

# ============================================================
# BACKEND — CONFIG
# ============================================================

Write-IfEmpty "lib/backend/config/app_config.dart" @"
// =============================================================
// FILE   : lib/backend/config/app_config.dart
// TEKNIK : Runtime Configuration
// -------------------------------------------------------------
// FUNGSI :
//   Membaca variabel environment dari file .env.development
//   atau .env.production saat aplikasi pertama kali dijalankan.
//   Menyediakan nilai konfigurasi seperti nama database, base URL,
//   dan mode debug kepada seluruh bagian aplikasi.
//
// CARA PAKAI :
//   1. Tambahkan package flutter_dotenv di pubspec.yaml
//   2. Load file .env di main.dart sebelum runApp()
//   3. Akses nilai via AppConfig.dbName, AppConfig.isDebug, dst.
//
// CONTOH ISI .env :
//   DB_NAME=tata_saka.db
//   DEBUG=true
//
// CATATAN DEFENSIVE :
//   Validasi bahwa variabel wajib tidak kosong saat load.
//   Lempar Exception jika konfigurasi kritis tidak ditemukan.
// =============================================================
"@

# ============================================================
# BACKEND — CONSTANTS
# ============================================================

Write-IfEmpty "lib/backend/constants/role_permissions.dart" @"
// =============================================================
// FILE   : lib/backend/constants/role_permissions.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan tabel permission berbasis Map<String, List<String>>.
//   Setiap role (super_admin, admin_lapangan, kontraktor, client, aph)
//   dipetakan ke daftar aksi yang diizinkan.
//   Digunakan oleh permission_checker.dart untuk validasi hak akses.
//
// CARA PAKAI :
//   import role_permissions.dart, lalu:
//   final allowed = rolePermissions['super_admin']; // ['read','write',...]
//
// STRUKTUR TABEL :
//   const Map<String, List<String>> rolePermissions = {
//     'super_admin'    : ['read','write','delete','validate','grant_access'],
//     'admin_lapangan' : ['read','write','upload_photo'],
//     'kontraktor'     : ['read'],
//     'client'         : ['read'],
//     'aph'            : ['read'],  // hanya setelah izin super_admin
//   };
//
// CATATAN DEFENSIVE :
//   Jangan lookup role yang tidak ada di Map — tambahkan guard di
//   permission_checker.dart sebelum akses Map ini.
// =============================================================
"@

# ============================================================
# BACKEND — DATABASE TABLES
# ============================================================

Write-IfEmpty "lib/backend/database/tables/users_table.dart" @"
// =============================================================
// FILE   : lib/backend/database/tables/users_table.dart
// TEKNIK : (fondasi database, dipakai oleh Parameterization di repo)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'users' menggunakan Drift ORM.
//   Kolom yang dibutuhkan:
//     - id          : IntColumn, auto-increment primary key
//     - name        : TextColumn, nama lengkap pengguna
//     - email       : TextColumn, email unik pengguna
//     - role        : TextColumn, nilai: super_admin / admin_lapangan /
//                     kontraktor / client / aph
//     - createdAt   : DateTimeColumn, waktu akun dibuat
//
// CARA PAKAI :
//   Class ini di-include ke app_database.dart sebagai bagian dari
//   @DriftDatabase(tables: [Users, ...])
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
"@

Write-IfEmpty "lib/backend/database/tables/projects_table.dart" @"
// =============================================================
// FILE   : lib/backend/database/tables/projects_table.dart
// TEKNIK : (fondasi database, dipakai oleh Parameterization di repo)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'projects' menggunakan Drift ORM.
//   Kolom yang dibutuhkan:
//     - id          : IntColumn, auto-increment primary key
//     - name        : TextColumn, nama paket proyek
//     - location    : TextColumn, lokasi proyek
//     - startDate   : DateTimeColumn, tanggal mulai
//     - endDate     : DateTimeColumn, tanggal selesai (target)
//     - progress    : RealColumn, persentase kemajuan 0.0 - 100.0
//     - status      : TextColumn, nilai: aktif / selesai / pending
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
"@

Write-IfEmpty "lib/backend/database/tables/reports_table.dart" @"
// =============================================================
// FILE   : lib/backend/database/tables/reports_table.dart
// TEKNIK : (fondasi database, dipakai oleh Automata di report_provider)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'reports' menggunakan Drift ORM.
//   Tabel ini menyimpan laporan harian yang diinput dari lapangan.
//   Kolom yang dibutuhkan:
//     - id          : IntColumn, auto-increment primary key
//     - projectId   : IntColumn, foreign key ke tabel projects
//     - title       : TextColumn, judul / deskripsi laporan
//     - progress    : IntColumn, kemajuan harian (0-100)
//     - photoPath   : TextColumn nullable, path foto bukti lapangan
//     - status      : TextColumn, nilai: draft / submitted / approved / rejected
//     - createdAt   : DateTimeColumn, waktu laporan dibuat
//
// RELASI :
//   Satu project bisa punya banyak report (one-to-many).
//
// CATATAN :
//   Field 'status' adalah state dari FSM di report_provider.dart.
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
"@

Write-IfEmpty "lib/backend/database/tables/tasks_table.dart" @"
// =============================================================
// FILE   : lib/backend/database/tables/tasks_table.dart
// TEKNIK : (fondasi database)
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan skema tabel 'tasks' menggunakan Drift ORM.
//   Menyimpan item-item pekerjaan dalam satu paket proyek.
//   Kolom yang dibutuhkan:
//     - id          : IntColumn, auto-increment primary key
//     - projectId   : IntColumn, foreign key ke tabel projects
//     - description : TextColumn, deskripsi item pekerjaan
//     - volume      : RealColumn, volume pekerjaan
//     - unit        : TextColumn, satuan (m2, m3, unit, dsb.)
//     - isDone      : BoolColumn, apakah item sudah selesai
//
// CATATAN :
//   Setelah mengedit tabel ini, wajib jalankan:
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
"@

Write-IfEmpty "lib/backend/database/app_database.dart" @"
// =============================================================
// FILE   : lib/backend/database/app_database.dart
// TEKNIK : (fondasi database — dipakai oleh semua repository)
// -------------------------------------------------------------
// FUNGSI :
//   Titik pusat koneksi SQLite menggunakan Drift ORM.
//   Mendaftarkan semua tabel (Users, Projects, Reports, Tasks)
//   ke dalam satu database class dengan @DriftDatabase annotation.
//   File .g.dart akan di-generate otomatis oleh build_runner.
//
// CARA PAKAI :
//   final db = AppDatabase();
//   // lalu inject ke repository via constructor
//
// PENTING :
//   Untuk Flutter Web (PWA), gunakan WasmDatabase.open() bukan
//   NativeDatabase agar bisa jalan di browser.
//   Untuk testing, gunakan NativeDatabase.memory().
//
// SETELAH DIEDIT :
//   dart run build_runner build --delete-conflicting-outputs
// =============================================================
"@

# ============================================================
# BACKEND — MODELS
# ============================================================

Write-IfEmpty "lib/backend/models/db_result.dart" @"
// =============================================================
// FILE   : lib/backend/models/db_result.dart
// TEKNIK : Parameterization / Generics
// -------------------------------------------------------------
// FUNGSI :
//   Wrapper generic DbResult<T> untuk membungkus hasil operasi
//   database (sukses atau gagal) tanpa perlu throw exception
//   langsung ke UI. Mirip seperti Either<Error, Data>.
//
// STRUKTUR :
//   class DbResult<T> {
//     final T? data;
//     final String? errorMessage;
//     final bool isSuccess;
//   }
//
// CARA PAKAI :
//   // Di repository:
//   return DbResult.success(data: listProyek);
//   return DbResult.failure(message: 'Data tidak ditemukan');
//
//   // Di provider / UI:
//   if (result.isSuccess) { ... result.data ... }
//   else { showError(result.errorMessage); }
//
// CATATAN :
//   Dengan generics <T>, satu class ini bisa dipakai untuk semua
//   tipe data: DbResult<List<ProjectModel>>, DbResult<ReportModel>, dst.
// =============================================================
"@

Write-IfEmpty "lib/backend/models/project_model.dart" @"
// =============================================================
// FILE   : lib/backend/models/project_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data paket proyek.
//   Berbeda dari Drift table — ini adalah plain Dart class
//   yang dipakai di layer provider dan UI.
//   Di-convert dari/ke Drift CompanionData di repository.
//
// FIELD :
//   - id        : int
//   - name      : String   (tidak boleh kosong)
//   - location  : String
//   - startDate : DateTime
//   - endDate   : DateTime (harus setelah startDate)
//   - progress  : double   (0.0 - 100.0)
//   - status    : String
//
// DEFENSIVE PROGRAMMING :
//   Tambahkan assert di constructor:
//   assert(name.isNotEmpty, 'Nama proyek tidak boleh kosong')
//   assert(progress >= 0 && progress <= 100, 'Progress harus 0-100')
//   assert(endDate.isAfter(startDate), 'endDate harus setelah startDate')
// =============================================================
"@

Write-IfEmpty "lib/backend/models/report_model.dart" @"
// =============================================================
// FILE   : lib/backend/models/report_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data laporan harian.
//   Digunakan di layer provider, UI, dan dikirim ke repository
//   untuk disimpan ke SQLite via Drift.
//
// FIELD :
//   - id        : int
//   - projectId : int     (wajib valid, > 0)
//   - title     : String  (tidak boleh kosong)
//   - progress  : int     (0 - 100)
//   - photoPath : String? (nullable, path foto lapangan)
//   - status    : String  (draft/submitted/approved/rejected)
//   - createdAt : DateTime
//
// DEFENSIVE PROGRAMMING :
//   assert(title.isNotEmpty, 'Judul laporan tidak boleh kosong')
//   assert(progress >= 0 && progress <= 100, 'Progress harus 0-100')
//   assert(projectId > 0, 'projectId tidak valid')
//   assert(!createdAt.isAfter(DateTime.now()), 'Tanggal tidak valid')
// =============================================================
"@

Write-IfEmpty "lib/backend/models/user_model.dart" @"
// =============================================================
// FILE   : lib/backend/models/user_model.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Model domain untuk data pengguna aplikasi.
//   Menyimpan informasi akun dan role yang menentukan hak akses
//   (dipakai bersama role_permissions.dart).
//
// FIELD :
//   - id        : int
//   - name      : String  (tidak boleh kosong)
//   - email     : String  (harus mengandung '@')
//   - role      : String  (harus salah satu dari role yang valid)
//   - createdAt : DateTime
//
// DEFENSIVE PROGRAMMING :
//   final validRoles = ['super_admin','admin_lapangan','kontraktor','client','aph'];
//   assert(name.isNotEmpty, 'Nama tidak boleh kosong')
//   assert(email.contains('@'), 'Format email tidak valid')
//   assert(validRoles.contains(role), 'Role tidak dikenal: \$role')
// =============================================================
"@

# ============================================================
# BACKEND — REPOSITORIES
# ============================================================

Write-IfEmpty "lib/backend/repositories/base_repository.dart" @"
// =============================================================
// FILE   : lib/backend/repositories/base_repository.dart
// TEKNIK : Parameterization / Generics
// -------------------------------------------------------------
// FUNGSI :
//   Abstract class generik BaseRepository<T> yang mendefinisikan
//   kontrak operasi CRUD standar untuk semua repository.
//   Setiap repository konkret (Project, Report, User) meng-extend
//   class ini dan mengisi implementasinya masing-masing.
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
// MANFAAT GENERICS :
//   Dengan <T>, satu abstract class ini berlaku untuk semua tipe
//   model tanpa menulis ulang signature yang sama berkali-kali.
//   ProjectRepository extends BaseRepository<ProjectModel>
//   ReportRepository  extends BaseRepository<ReportModel>
//   UserRepository    extends BaseRepository<UserModel>
// =============================================================
"@

Write-IfEmpty "lib/backend/repositories/project_repository.dart" @"
// =============================================================
// FILE   : lib/backend/repositories/project_repository.dart
// TEKNIK : Parameterization (via BaseRepository<ProjectModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<ProjectModel>.
//   Bertanggung jawab untuk semua operasi CRUD tabel 'projects'
//   di SQLite menggunakan Drift.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()          : ambil semua proyek
//   - getById(int id)   : ambil proyek berdasarkan ID
//   - add(ProjectModel) : tambah proyek baru, return id
//   - update(id, model) : update data proyek, return bool
//   - delete(id)        : hapus proyek, return bool
//
// TAMBAHAN (opsional) :
//   - getByStatus(String status) : filter proyek by status
//
// DEFENSIVE :
//   Tambahkan precondition sebelum operasi insert/update:
//   assert(model.name.isNotEmpty, 'Nama proyek tidak boleh kosong')
// =============================================================
"@

Write-IfEmpty "lib/backend/repositories/report_repository.dart" @"
// =============================================================
// FILE   : lib/backend/repositories/report_repository.dart
// TEKNIK : Parameterization (via BaseRepository<ReportModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<ReportModel>.
//   Bertanggung jawab untuk semua operasi CRUD tabel 'reports'
//   di SQLite menggunakan Drift.
//   Ini adalah repository yang PALING SERING DIAKSES karena
//   laporan harian diinput setiap hari dari lapangan.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()               : ambil semua laporan
//   - getById(int id)        : ambil laporan berdasarkan ID
//   - getByProjectId(int id) : ambil laporan per proyek (TAMBAHAN PENTING)
//   - add(ReportModel)       : simpan laporan baru, return id
//   - update(id, model)      : update laporan, return bool
//   - delete(id)             : hapus laporan, return bool
//
// DIPAKAI OLEH :
//   report_provider.dart (FSM Automata) untuk transisi status laporan.
//
// DEFENSIVE :
//   assert(model.title.isNotEmpty)
//   assert(model.progress >= 0 && model.progress <= 100)
// =============================================================
"@

Write-IfEmpty "lib/backend/repositories/user_repository.dart" @"
// =============================================================
// FILE   : lib/backend/repositories/user_repository.dart
// TEKNIK : Parameterization (via BaseRepository<UserModel>)
//          + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Implementasi konkret dari BaseRepository<UserModel>.
//   Bertanggung jawab untuk operasi CRUD tabel 'users' di SQLite.
//   Menyimpan data pengguna lokal yang disinkronkan dengan
//   Firebase Authentication.
//
// METHOD YANG DIIMPLEMENTASI :
//   - getAll()             : ambil semua user
//   - getById(int id)      : ambil user berdasarkan ID lokal
//   - getByEmail(String)   : cari user berdasarkan email (TAMBAHAN)
//   - add(UserModel)       : tambah user baru
//   - update(id, model)    : update data user
//   - delete(id)           : hapus user
//
// DEFENSIVE :
//   assert(model.email.contains('@'), 'Email tidak valid')
//   assert(model.name.isNotEmpty, 'Nama tidak boleh kosong')
// =============================================================
"@

# ============================================================
# BACKEND — SERVICES
# ============================================================

Write-IfEmpty "lib/backend/services/auth_service.dart" @"
// =============================================================
// FILE   : lib/backend/services/auth_service.dart
// TEKNIK : API
// -------------------------------------------------------------
// FUNGSI :
//   Menangani semua operasi autentikasi pengguna menggunakan
//   Firebase Authentication SDK.
//   Menjadi perantara antara auth_provider.dart (FSM) dan
//   Firebase Auth API.
//
// METHOD YANG PERLU DIBUAT :
//   - signIn(email, password)  : login, return UserCredential
//   - signOut()                : logout
//   - resetPassword(email)     : kirim email reset password
//   - getCurrentUser()         : ambil user yang sedang login
//   - authStateChanges()       : Stream<User?> untuk listen status login
//
// CARA PAKAI :
//   import package:firebase_auth/firebase_auth.dart
//   final _auth = FirebaseAuth.instance;
//
// DEFENSIVE :
//   Wrap setiap call Firebase dengan try-catch FirebaseAuthException.
//   Validasi email tidak kosong sebelum memanggil API.
//
// CATATAN :
//   Ini adalah teknik API — pastikan dokumentasikan setiap
//   method Firebase yang dipakai di laporan tugas besar.
// =============================================================
"@

Write-IfEmpty "lib/backend/services/storage_service.dart" @"
// =============================================================
// FILE   : lib/backend/services/storage_service.dart
// TEKNIK : API
// -------------------------------------------------------------
// FUNGSI :
//   Menangani upload dan download foto dokumentasi lapangan
//   menggunakan Firebase Storage SDK.
//
// METHOD YANG PERLU DIBUAT :
//   - uploadPhoto(File file, String path) : upload foto, return download URL
//   - deletePhoto(String url)             : hapus foto dari Storage
//   - getPhotoUrl(String path)            : ambil URL foto
//
// CARA PAKAI :
//   import package:firebase_storage/firebase_storage.dart
//   final _storage = FirebaseStorage.instance;
//
// ALUR UPLOAD :
//   1. Pengguna pilih foto via image_picker (di photo_upload_widget)
//   2. File dikirim ke uploadPhoto()
//   3. URL yang dikembalikan disimpan ke field photoPath di ReportModel
//   4. ReportModel disimpan ke SQLite via report_repository
//
// DEFENSIVE :
//   Validasi file tidak null dan ukuran tidak melebihi batas (misal 5MB).
//   Wrap upload dengan try-catch FirebaseException.
// =============================================================
"@

Write-IfEmpty "lib/backend/services/pdf_service.dart" @"
// =============================================================
// FILE   : lib/backend/services/pdf_service.dart
// TEKNIK : Code Reuse / Library
// -------------------------------------------------------------
// FUNGSI :
//   Menghasilkan file PDF laporan proyek menggunakan package 'pdf'
//   dan menampilkan/download-nya via package 'printing'.
//   Service ini dipanggil dari berbagai screen (report_detail,
//   dashboard) — itulah mengapa ini masuk kategori Code Reuse.
//
// METHOD YANG PERLU DIBUAT :
//   - generateReportPdf(ReportModel report) : buat PDF satu laporan
//   - generateProjectSummaryPdf(ProjectModel) : buat PDF rekap proyek
//   - printOrDownload(Uint8List pdfBytes)    : tampilkan dialog print/download
//
// CARA PAKAI :
//   import 'package:pdf/pdf.dart';
//   import 'package:pdf/widgets.dart' as pw;
//   import 'package:printing/printing.dart';
//
// CATATAN :
//   Karena service ini DIPAKAI ULANG di banyak tempat tanpa
//   duplikasi kode — ini adalah implementasi teknik Code Reuse.
//   Dokumentasikan hal ini di laporan tugas besar.
// =============================================================
"@

# ============================================================
# FRONTEND — CORE
# ============================================================

Write-IfEmpty "lib/Frontend/core/constants/status_config.dart" @"
// =============================================================
// FILE   : lib/Frontend/core/constants/status_config.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan tabel konfigurasi UI untuk setiap nilai status.
//   Memetakan string status ke properti tampilan (warna, label, icon)
//   sehingga UI tidak perlu pakai if-else panjang.
//
// STRUKTUR :
//   class StatusConfig {
//     final Color color;
//     final String label;
//     final IconData icon;
//   }
//
//   const Map<String, StatusConfig> statusConfigMap = {
//     'draft'     : StatusConfig(color: Colors.grey,   label: 'Draft',     icon: Icons.edit),
//     'submitted' : StatusConfig(color: Colors.blue,   label: 'Dikirim',   icon: Icons.send),
//     'approved'  : StatusConfig(color: Colors.green,  label: 'Disetujui', icon: Icons.check),
//     'rejected'  : StatusConfig(color: Colors.red,    label: 'Ditolak',   icon: Icons.close),
//     'aktif'     : StatusConfig(color: Colors.orange, label: 'Aktif',     icon: Icons.work),
//     'selesai'   : StatusConfig(color: Colors.green,  label: 'Selesai',   icon: Icons.done_all),
//   };
//
// CARA PAKAI :
//   Dipakai oleh status_badge.dart dan card widget untuk
//   render tampilan status tanpa if-else.
//   final config = statusConfigMap[status];
// =============================================================
"@

Write-IfEmpty "lib/Frontend/core/router/app_router.dart" @"
// =============================================================
// FILE   : lib/Frontend/core/router/app_router.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan seluruh routing aplikasi dalam bentuk tabel
//   list GoRoute menggunakan package go_router.
//   Dengan table-driven, semua route terdefinisi di SATU TEMPAT
//   tanpa perlu mencari-cari di berbagai file.
//
// STRUKTUR :
//   final GoRouter appRouter = GoRouter(
//     routes: [
//       GoRoute(path: '/login',     builder: (ctx, state) => LoginPage()),
//       GoRoute(path: '/dashboard', builder: (ctx, state) => DashboardPage()),
//       GoRoute(path: '/projects',  builder: (ctx, state) => ProjectListPage()),
//       GoRoute(path: '/reports',   builder: (ctx, state) => ReportListPage()),
//       GoRoute(path: '/admin',     builder: (ctx, state) => UserManagementPage()),
//     ],
//     redirect: (ctx, state) {
//       // Cek apakah user sudah login, redirect ke /login jika belum
//     },
//   );
//
// CARA PAKAI :
//   Di MaterialApp.router: routerConfig: appRouter
//   Navigasi: context.go('/dashboard')
//
// CATATAN :
//   Tambahkan guard redirect berdasarkan role menggunakan
//   role_permissions.dart agar halaman admin tidak bisa diakses
//   oleh kontraktor/client.
// =============================================================
"@

# ============================================================
# FRONTEND — PROVIDERS
# ============================================================

Write-IfEmpty "lib/Frontend/providers/auth_provider.dart" @"
// =============================================================
// FILE   : lib/Frontend/providers/auth_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state autentikasi pengguna menggunakan FSM.
//   Setiap perubahan state hanya boleh terjadi melalui transisi
//   yang sudah didefinisikan — tidak boleh loncat sembarangan.
//
// STATE (AuthState enum) :
//   unauthenticated → loading → authenticated
//                          ↘→ error → unauthenticated
//
// TRANSISI YANG VALID :
//   login()   : unauthenticated → loading → authenticated / error
//   logout()  : authenticated   → unauthenticated
//   retry()   : error           → unauthenticated
//
// CARA PAKAI :
//   Gunakan Riverpod StateNotifier atau ChangeNotifier.
//   UI listen ke state ini untuk tampilkan loading/error/halaman utama.
//
// DEFENSIVE :
//   Di setiap method transisi, tambahkan assert untuk memastikan
//   state awal sesuai sebelum transisi dijalankan.
//   Contoh: assert(state == AuthState.unauthenticated, '...')
//
// INTEGRASI :
//   Panggil auth_service.dart untuk operasi Firebase Auth yang sebenarnya.
// =============================================================
"@

Write-IfEmpty "lib/Frontend/providers/report_provider.dart" @"
// =============================================================
// FILE   : lib/Frontend/providers/report_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state workflow laporan harian menggunakan FSM.
//   Mengatur transisi status laporan dari draft sampai approved/rejected.
//
// STATE (ReportState enum) :
//   draft → submitted → approved
//                   ↘→ rejected → draft (revisi)
//
// TRANSISI YANG VALID :
//   submit()  : draft     → submitted
//   approve() : submitted → approved
//   reject()  : submitted → rejected
//   revise()  : rejected  → draft
//
// CARA PAKAI :
//   Admin lapangan: panggil submit() setelah mengisi form laporan.
//   Super admin   : panggil approve() atau reject() setelah review.
//
// DEFENSIVE :
//   assert(state == ReportState.draft, 'submit() hanya dari state DRAFT')
//   assert(state == ReportState.submitted, 'approve() hanya dari SUBMITTED')
//
// INTEGRASI :
//   Setelah transisi state, update field 'status' di ReportModel
//   dan simpan via report_repository.dart ke SQLite.
// =============================================================
"@

Write-IfEmpty "lib/Frontend/providers/upload_provider.dart" @"
// =============================================================
// FILE   : lib/Frontend/providers/upload_provider.dart
// TEKNIK : Automata (Finite State Machine) + Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Mengelola state proses upload foto lapangan menggunakan FSM.
//   Memastikan proses upload berjalan satu per satu dan UI
//   selalu menampilkan status yang akurat.
//
// STATE (UploadState enum) :
//   idle → picking → uploading → success
//              ↘→ failed → idle (retry)
//         ↗ (user batal)
//
// TRANSISI YANG VALID :
//   pickPhoto()    : idle      → picking
//   startUpload()  : picking   → uploading
//   onSuccess()    : uploading → success
//   onFailed()     : uploading → failed
//   reset()        : success/failed → idle
//
// CARA PAKAI :
//   Dipakai oleh photo_upload_widget.dart.
//   UI listen ke state ini untuk tampilkan progress bar / error / preview foto.
//
// DEFENSIVE :
//   assert(state == UploadState.idle, 'pickPhoto() hanya dari state IDLE')
//   Jangan allow upload kalau state bukan 'picking'.
//
// INTEGRASI :
//   startUpload() memanggil storage_service.dart untuk upload ke Firebase Storage.
//   URL hasil upload disimpan ke ReportModel.photoPath.
// =============================================================
"@

# ============================================================
# FRONTEND — UTILS
# ============================================================

Write-IfEmpty "lib/Frontend/utils/validators.dart" @"
// =============================================================
// FILE   : lib/Frontend/utils/validators.dart
// TEKNIK : Defensive Programming
// -------------------------------------------------------------
// FUNGSI :
//   Kumpulan fungsi validasi input form yang digunakan di
//   berbagai screen (report_form, login, user_management).
//   Ini adalah implementasi Defensive Programming di layer frontend —
//   memastikan data yang masuk ke backend selalu valid.
//
// FUNGSI YANG PERLU DIBUAT :
//   static String? validateTitle(String? value)
//     → null jika valid, pesan error jika tidak
//   static String? validateEmail(String? value)
//     → cek format email mengandung '@' dan domain
//   static String? validateProgress(String? value)
//     → cek angka antara 0-100
//   static String? validatePassword(String? value)
//     → minimal 6 karakter
//   static String? validateNotEmpty(String? value, String fieldName)
//     → generic validator untuk field wajib isi
//
// CARA PAKAI :
//   Di TextFormField:
//   validator: Validators.validateTitle,
//
// CATATAN :
//   Return null = valid (tidak ada error).
//   Return String = pesan error yang ditampilkan di bawah field.
// =============================================================
"@

Write-IfEmpty "lib/Frontend/utils/permission_checker.dart" @"
// =============================================================
// FILE   : lib/Frontend/utils/permission_checker.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Helper class untuk mengecek apakah role pengguna saat ini
//   memiliki izin untuk melakukan suatu aksi.
//   Menggunakan rolePermissions Map dari role_permissions.dart
//   sebagai tabel rujukan — tidak ada hardcode if-else di sini.
//
// FUNGSI YANG PERLU DIBUAT :
//   static bool canDo(String role, String action)
//     → cek apakah role bisa melakukan action tertentu
//     → contoh: canDo('kontraktor', 'delete') → false
//
//   static bool canAccessPage(String role, String routePath)
//     → cek apakah role boleh mengakses halaman tertentu
//     → dipakai di app_router.dart untuk redirect guard
//
// CARA PAKAI :
//   if (PermissionChecker.canDo(currentUser.role, 'write')) {
//     // tampilkan tombol tambah laporan
//   }
//
// DEFENSIVE :
//   Tambahkan guard jika role tidak dikenal:
//   if (!rolePermissions.containsKey(role)) return false;
//   Jangan biarkan role tidak valid lolos tanpa error.
// =============================================================
"@

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " Selesai! Cek output di atas." -ForegroundColor Cyan
Write-Host " Hijau  = berhasil diisi komentar" -ForegroundColor Green
Write-Host " Kuning = dilewati (sudah ada isi)" -ForegroundColor Yellow
Write-Host " Merah  = file tidak ditemukan" -ForegroundColor Red
Write-Host "=====================================" -ForegroundColor Cyan
