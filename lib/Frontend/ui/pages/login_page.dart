import 'dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

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
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.4, // Maksimal 40% tinggi layar
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: Center( // Dibungkus Center agar form tidak terlalu lebar di Web
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500), // Maksimal lebar form 500px
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 60),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 140,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Selamat Datang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Silahkan masuk ke akun anda\nuntuk melanjutkan.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFF0011FF),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Ingat saya',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardPage()),
                      );
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0011FF),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}