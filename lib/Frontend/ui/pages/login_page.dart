import 'package:flutter/material.dart';
import 'package:my_app/Frontend/ui/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    // Memastikan kontrak input terpenuhi
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      // Memberikan feedback jika input tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Silakan isi email dan password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            children: [
              // Placeholder Logo
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.business, size: 60, color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              const Text(
                "SISTEM MONITORING PROYEK",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0D1B3E)),
              ),
              const Text(
                "CV. TATA SAKA CONSULTANT",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              const Text("Masuk Untuk Melanjutkan", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              
              // Input Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    height: 24, width: 24,
                    child: Checkbox(value: true, onChanged: (val) {}, activeColor: const Color(0xFF0D1B3E)),
                  ),
                  const SizedBox(width: 8),
                  const Text("Ingat saya"),
                ],
              ),
              const SizedBox(height: 30),
              
              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D1B3E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _handleLogin,
                  child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 40),
              const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  children: [TextSpan(text: "Contact Us", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D1B3E)))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}