import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen_ajeng extends StatelessWidget {
  const LoginScreen_ajeng({super.key});

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

            // Username
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user),
                hintText: "Username",
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
                onPressed: () {},
                child: const Text(
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
