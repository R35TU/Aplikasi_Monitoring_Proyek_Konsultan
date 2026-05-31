import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/bottom_bg.png',
                  width: double.infinity,
                  // Menggunakan cover agar tidak rusak di layar lebar
                  fit: BoxFit.cover, 
                  height: MediaQuery.of(context).size.height * 0.4, // Maksimal 40% tinggi layar
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CV. TATA SAKA CONSULTANT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'KONSULTANT : PERENCANAAN DAN SUPERVISI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}