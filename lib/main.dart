import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Frontend/ui/pages/splash_page.dart';
import 'backend/config/app_config.dart';
import 'backend/database/app_database.dart';
import 'backend/repositories/user_repository.dart';
import 'backend/repositories/project_repository.dart';
import 'backend/repositories/report_repository.dart';
import 'backend/repositories/task_repository.dart';
import 'backend/repositories/document_repository.dart';
import 'backend/repositories/activity_history_repository.dart';
import 'backend/services/storage_service.dart';

import 'Frontend/providers/auth_provider.dart';
import 'Frontend/providers/project_provider.dart';
import 'Frontend/providers/report_provider.dart';
import 'Frontend/providers/dashboard_provider.dart';
import 'Frontend/providers/activity_history_provider.dart';
import 'Frontend/providers/upload_provider.dart';

import 'backend/models/user_model.dart';
import 'backend/models/project_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await AppConfig.initialize(isProduction: false);
  } catch (e) {
    debugPrint('INITIALIZATION ERROR: $e');
  }

  // Inisialisasi AppDatabase sebagai singleton
  final db = AppDatabase();

  // Inisialisasi Repositories
  final userRepository = UserRepository(db);
  final projectRepository = ProjectRepository(db);
  final reportRepository = ReportRepository(db);
  final taskRepository = TaskRepository(db);
  final documentRepository = DocumentRepository(db);
  final activityHistoryRepository = ActivityHistoryRepository(db);

  // Inisialisasi Services
  final storageService = StorageService();

  // Seed data awal jika database masih kosong
  await _seedDatabase(userRepository, projectRepository);

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: db),
        Provider<UserRepository>.value(value: userRepository),
        Provider<ProjectRepository>.value(value: projectRepository),
        Provider<ReportRepository>.value(value: reportRepository),
        Provider<TaskRepository>.value(value: taskRepository),
        Provider<DocumentRepository>.value(value: documentRepository),
        Provider<ActivityHistoryRepository>.value(value: activityHistoryRepository),
        Provider<StorageService>.value(value: storageService),

        ChangeNotifierProvider(create: (_) => AuthProvider(userRepository)),
        ChangeNotifierProvider(create: (_) => ProjectProvider(projectRepository)),
        ChangeNotifierProvider(create: (_) => ReportProvider(reportRepository)),
        ChangeNotifierProvider(create: (_) => ActivityHistoryProvider(activityHistoryRepository)),
        ChangeNotifierProvider(create: (_) => UploadProvider(storageService)),
        ChangeNotifierProxyProvider2<ProjectProvider, ReportProvider, DashboardProvider>(
          create: (_) => DashboardProvider(
            projectRepository: projectRepository,
            reportRepository: reportRepository,
          ),
          update: (_, __, ___, dashboard) => dashboard!..loadDataFromDatabase(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _seedDatabase(
  UserRepository userRepo,
  ProjectRepository projectRepo,
) async {
  try {
    final existingUsers = await userRepo.getAll();
    if (existingUsers.isEmpty) {
      // Seed Admin User
      final admin = UserModel(
        id: 'admin_uid_123',
        name: 'Super Admin Tata Saka',
        email: 'admin',
        role: 'super_admin',
        nomorHp: '08123456789',
      );
      await userRepo.registerWithPassword(admin, 'admin123');

      // Seed Lapangan User
      final pengawas = UserModel(
        id: 'pengawas_uid_123',
        name: 'Putra Pengawas',
        email: 'pengawas',
        role: 'admin_lapangan',
        nomorHp: '08987654321',
      );
      await userRepo.registerWithPassword(pengawas, 'pengawas123');

      // Seed Dummy Projects
      final dummyProjects = [
        ProjectModel(
          title: 'Pembangunan Jembatan',
          location: 'Purwokerto',
          kategori: 'Infrastruktur',
          status: 'Progres',
          targetProgress: 0.8,
          actualProgress: 0.5,
          imagePath: 'assets/images/bottom_bg.png',
        ),
        ProjectModel(
          title: 'Gor Hebat Mantap',
          location: 'Purbalingga',
          kategori: 'Gedung',
          status: 'Selesai',
          targetProgress: 1.0,
          actualProgress: 1.0,
          imagePath: 'assets/images/bottom_bg.png',
        ),
        ProjectModel(
          title: 'Gorong Gorong Manukan',
          location: 'Surabaya',
          kategori: 'Infrastruktur',
          status: 'Selesai',
          targetProgress: 1.0,
          actualProgress: 1.0,
          imagePath: 'assets/images/bottom_bg.png',
        ),
        ProjectModel(
          title: 'Aspal Jl.Desa Kesugihan',
          location: 'Cilacap',
          kategori: 'Infrastruktur',
          status: 'Progres',
          targetProgress: 0.8,
          actualProgress: 0.5,
          imagePath: 'assets/images/bottom_bg.png',
        ),
        ProjectModel(
          title: 'Koperasi Hitam Putih',
          location: 'Alam Lain',
          kategori: 'Gedung',
          status: 'Progres',
          targetProgress: 0.1,
          actualProgress: 0.1,
          imagePath: 'assets/images/bottom_bg.png',
        ),
      ];

      for (final project in dummyProjects) {
        await projectRepo.add(project);
      }

      debugPrint('DATABASE SEEDING SUCCESSFUL');
    }
  } catch (e) {
    debugPrint('DATABASE SEEDING ERROR: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Proyek Konsultan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0011FF)),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}