import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool _isLoading = false;

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  Future<void> _login() async {
    final email = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const DashboardPage(),
            ),
          );
        }
      }
    } on AuthException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Terjadi kesalahan yang tidak terduga')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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

          /// Isi halaman
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 430,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [

                        SizedBox(height: height * 0.03),

                        /// Logo
                        Image.asset(
                          "assets/images/logo.png",
                          width: 120,
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          "Selamat Datang",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Silahkan masuk ke akun anda\nuntuk melanjutkan.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 40),

                        /// Username
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        /// Password
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// Remember me
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: rememberMe,
                                activeColor:
                                    const Color(0xff0D24FF),
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe =
                                        value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Ingat saya",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// Tombol Login
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xff0D24FF),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _isLoading ? null : _login,
                            child: _isLoading 
                                ? const SizedBox(
                                    width: 24, height: 24, 
                                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                  )
                                : const Text(
                              "Masuk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.18),

                        /// Contact us
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [

                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Contact Us",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),

                          ],
                        ),

                        const SizedBox(height: 20),

                      ],
                    ),
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