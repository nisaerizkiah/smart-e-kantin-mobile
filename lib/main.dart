import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/firebase_services_kifiyah.dart';
import 'providers/cart_provider_lilis.dart';

// Screens
import 'screens/login/login_screen_ajeng.dart';
import 'screens/register/register_screen_ajeng.dart';
import 'screens/home/home_screen_ajeng.dart';
import 'screens/cart/cart_screen_ajeng.dart'; // <-- Tambahkan ini

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart E-Kantin',
      debugShowCheckedModeBanner: false, // Hilangkan label DEBUG
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Sora",
        useMaterial3: true,
      ),

      home: const LoginScreen_ajeng(), // Halaman pertama

      routes: {
        "/login": (context) => const LoginScreen_ajeng(),
        "/register": (context) => const RegisterScreen_ajeng(),
        "/home": (context) => const HomeScreen_ajeng(),
        "/cart": (context) => const CartScreen_ajeng(), // <-- sekarang cart bisa dipanggil
      },
    );
  }
}
