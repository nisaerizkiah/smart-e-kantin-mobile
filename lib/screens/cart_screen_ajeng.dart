import 'package:flutter/material.dart';

class CartScreen_ajeng extends StatelessWidget {
  const CartScreen_ajeng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          "Keranjang kamu masih kosong",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}