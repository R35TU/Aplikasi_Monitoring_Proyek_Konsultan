import 'package:MyApp/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'ui/pages/login_page.dart'; // Pastikan nama file sesuai dengan yang kamu buat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tata Saka Monitoring',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        // Mengatur warna utama aplikasi (Navy Dark)
        primaryColor: const Color(0xFF0D1B3E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D1B3E),
          primary: const Color(0xFF0D1B3E),
        ),
        // Mengatur font default agar terlihat bersih
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      // Halaman pertama yang muncul saat aplikasi dibuka
      home: WelcomePage(),
    );
  }
}