import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Frontend/ui/pages/splash_page.dart';
import 'backend/config/app_config.dart';
import 'backend/database/app_database.dart';
import 'backend/services/auth_service.dart';
import 'backend/repositories/project_repository.dart';
import 'backend/repositories/report_repository.dart';
import 'Frontend/providers/auth_provider.dart';
import 'Frontend/providers/dashboard_provider.dart';
import 'Frontend/providers/project_provider.dart';
import 'Frontend/providers/report_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Config
  await AppConfig.load();

  // 2. Initialize Database
  final db = AppDatabase();

  // 3. Initialize Services & Repositories
  final authService = AuthService(db);
  final projectRepo = ProjectRepository(db);
  final reportRepo = ReportRepository(db);

  // 4. Seed Database
  await authService.seedDefaultUser();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(authService)),
        ChangeNotifierProvider(create: (_) => DashboardProvider(projectRepo)),
        ChangeNotifierProvider(create: (_) => ProjectProvider(projectRepo)..loadProjects()),
        ChangeNotifierProvider(create: (_) => ReportProvider(reportRepo)),
      ],
      child: const MyApp(),
    ),
  );
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