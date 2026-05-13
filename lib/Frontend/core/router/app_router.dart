// =============================================================
// FILE   : lib/Frontend/core/router/app_router.dart
// TEKNIK : Table-Driven Construction
// -------------------------------------------------------------
// FUNGSI :
//   Mendefinisikan seluruh routing aplikasi dalam bentuk tabel
//   list GoRoute menggunakan package go_router.
//   Semua route terdefinisi di SATU TEMPAT.
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
//       // Cek login status, redirect ke /login jika belum login
//       // Cek role via PermissionChecker untuk halaman admin
//     },
//   );
//
// CARA PAKAI :
//   Di MaterialApp.router: routerConfig: appRouter
//   Navigasi: context.go('/dashboard')
// =============================================================
