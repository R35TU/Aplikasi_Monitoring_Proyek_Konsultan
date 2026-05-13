import 'package:my_app/Frontend/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //code reuse provider untuk state management
import 'package:my_app/Frontend/providers/dashboard_provider.dart'; 

void main() {
  runApp(
    // Membungkus aplikasi dengan MultiProvider agar state bisa diakses global
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        // Jika nanti ada AuthProvider, tinggal tambah di sini
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
      title: 'Tata Saka Monitoring',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Mengatur warna utama aplikasi sesuai keinginanmu
        primaryColor: const Color(0xFF0D1B3E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D1B3E),
          primary: const Color(0xFF0D1B3E),
        ),
        // Mengatur font default 
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: const WelcomePage(),
    );
  }
}