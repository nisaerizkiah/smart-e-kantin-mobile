import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../services/firebase_service_kifiyah.dart';
import 'home_screen_ajeng.dart';

class LoginScreen_ajeng extends StatefulWidget {
  const LoginScreen_ajeng({super.key});

  @override
  State<LoginScreen_ajeng> createState() => _LoginScreen_ajengState();
}

class _LoginScreen_ajengState extends State<LoginScreen_ajeng> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseServiceKifiyah _firebaseService = FirebaseServiceKifiyah();

  bool isLoading = false;

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email dan password wajib diisi")));
      return;
    }

    setState(() => isLoading = true);

    try {
      await _firebaseService.signIn(email, password);

      // Ambil NIM user (jika diperlukan)
      String? nim = await _firebaseService.getNimByEmail(email);
      print("NIM user: $nim");

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen_ajeng()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login gagal: $e")));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),

            Text(
              "E-Kantin",
              style: TextStyle(
                fontFamily: "Sora",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Masuk untuk melanjutkan",
              style: TextStyle(
                fontFamily: "Sora",
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            // Email
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user),
                hintText: "Email",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock),
                hintText: "Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: isLoading ? null : loginUser,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                "Belum punya akun? Daftar",
                style: TextStyle(
                  fontFamily: "Sora",
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}