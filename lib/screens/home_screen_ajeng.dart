import 'package:flutter/material.dart';
import 'cart_screen_ajeng.dart';

class HomeScreen_ajeng extends StatelessWidget {
  const HomeScreen_ajeng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Kantin"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen_ajeng()),
            );
          },
          child: const Text("Lihat Keranjang"),
        ),
      ),
    );
  }
}