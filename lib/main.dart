import 'package:flutter/material.dart';
import 'Frontend/ui/pages/splash_page.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'backend/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables dari .env
  const String envFile = String.fromEnvironment('ENV_FILE', defaultValue: '.env.production');
  await dotenv.load(fileName: envFile);
  
  // Initialize Supabase menggunakan AppConfig
  await Supabase.initialize(
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseAnonKey,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Proyek Konsultan',
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" merah di pojok kanan atas
      theme: ThemeData(
        // Menyesuaikan warna utama aplikasi dengan warna biru di desainmu
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0011FF)), 
        useMaterial3: true,
      ),
      // Menjadikan SplashPage sebagai halaman pertama yang dimuat saat aplikasi dibuka
      home: const SplashPage(), 
    );
  }
}