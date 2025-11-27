// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/firebase_services_kifiyah.dart';
import 'providers/cart_provider_lilis.dart';
import 'screens/login_screen_ajeng.dart';
import 'screens/register_screen_ajeng.dart';
import 'screens/home_screen_ajeng.dart';
import 'screens/cart_screen_ajeng.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // seed sample products if collection empty
  await FirebaseServiceKifiyah().seedProducts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProviderLilis())],
      child: MaterialApp(
        title: 'Smart E-Kantin',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          fontFamily: 'SatoshiGroupUnique',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen_ajeng(),
          '/register': (context) => RegisterScreen_ajeng(),
          '/home': (context) => HomeScreen_ajeng(),
          '/cart': (context) => CartScreen_ajeng(),
        },
      ),
    );
  }
}
