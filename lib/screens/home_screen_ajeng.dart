import 'package:flutter/material.dart';

class HomeScreen_ajeng extends StatelessWidget {
  const HomeScreen_ajeng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Menu Kantin",
          style: TextStyle(fontFamily: "Sora"),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          menuCard_ajeng("assets/images/nasi goreng.jpeg", "Nasi Goreng", 15000),
          const SizedBox(height: 16),

          menuCard_ajeng("assets/images/ayam geprek.jpeg", "Ayam Geprek", 18000),
          const SizedBox(height: 16),

          menuCard_ajeng("assets/images/bakso.jpeg", "Bakso", 12000),
        ],
      ),
    );
  }

  // Minimal card UI (UI-only sesuai tugas)
  Widget menuCard_ajeng(String img, String name, int price) {
    return Container(
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
            child: Image.asset(
              img,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
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
                    "Rp $price",
                    style: const TextStyle(
                      fontFamily: "Sora",
                      fontSize: 14,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
