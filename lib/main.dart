import 'package:flutter/material.dart';
import 'Frontend/ui/pages/splash_page.dart'; // Pastikan path import ini sesuai dengan letak filemu

void main() {
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