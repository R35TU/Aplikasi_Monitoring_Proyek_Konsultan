import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'login_page.dart';
import 'dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final isLoggedIn = await authProvider.checkRememberedUser();

      if (mounted) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardPage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [

          /// Background bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bottom_bg.png",
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),

          /// Logo tengah
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: width * 0.22,
            ),
          ),

          /// Text bawah
          Positioned(
            bottom: height * 0.045,
            left: 0,
            right: 0,
            child: Column(
              children: const [

                Text(
                  "CV. TATA SAKA CONSULTANT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "KONSULTANT : PERENCANAAN DAN SUPERVISI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    letterSpacing: 0.5,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}