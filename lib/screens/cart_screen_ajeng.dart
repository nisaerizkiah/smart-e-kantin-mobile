import 'package:flutter/material.dart';

class CartScreen_ajeng extends StatelessWidget {
  const CartScreen_ajeng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Keranjang",
          style: TextStyle(fontFamily: "Sora"),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          cartItem_ajeng("Nasi Goreng", 15000, 1),
          const SizedBox(height: 16),

          cartItem_ajeng("Ayam Geprek", 18000, 2),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total: Rp 51.000",
              style: TextStyle(
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12),
              ),
              onPressed: () {},
              child: const Text(
                "Checkout",
                style: TextStyle(
                  fontFamily: "Sora",
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cartItem_ajeng(String name, int price, int qty) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.fastfood, color: Colors.deepPurple, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: "Sora",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rp $price x $qty",
                  style: const TextStyle(
                    fontFamily: "Sora",
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
