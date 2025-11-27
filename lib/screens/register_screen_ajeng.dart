import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/user_model_kifiyah.dart';
import '../services/firebase_services_kifiyah.dart';
import 'login_screen_ajeng.dart';

class RegisterScreen_ajeng extends StatefulWidget {
  const RegisterScreen_ajeng({super.key});

  @override
  State<RegisterScreen_ajeng> createState() => _RegisterScreen_ajengState();
}

class _RegisterScreen_ajengState extends State<RegisterScreen_ajeng> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  final FirebaseServiceKifiyah _service = FirebaseServiceKifiyah();
  bool loading = false;

  registerUser() async {
    if (nameC.text.isEmpty || emailC.text.isEmpty || passC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field harus diisi")),
      );
      return;
    }

    setState(() => loading = true);

    try {
      // Firebase Auth
      final userCred = await _service.signIn(emailC.text, passC.text);

      // Simpan Firestore
      UserModelKifiyah user = UserModelKifiyah(
        userId: userCred.user!.uid,
        fullname: nameC.text,
        email: emailC.text,
        password: passC.text,
      );

      await _service.registerUser(user);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen_ajeng()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Gagal daftar: $e")));
    }

    setState(() => loading = false);
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
            const Text(
              "Daftar Akun",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Name
            TextField(
              controller: nameC,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user_add),
                hintText: "Nama lengkap",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Email
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.sms),
                hintText: "Email kampus",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password
            TextField(
              controller: passC,
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

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Daftar", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginScreen_ajeng()),
                  );
                },
                child: const Text(
                  "Sudah punya akun? Login",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}