import 'package:flutter/material.dart';
import 'cart_screen_ajeng.dart';

class HomeScreen_ajeng extends StatelessWidget {
  const HomeScreen_ajeng({super.key});

  // Data menu (TIDAK pakai const agar tidak error)
  final List<Map<String, dynamic>> menuItems = [
    {"name": "Air Mineral", "image": "assets/images/air mineral.jpeg", "price": 5000},
    {"name": "Ayam Geprek", "image": "assets/images/ayam geprek.jpeg", "price": 15000},
    {"name": "Bakso", "image": "assets/images/bakso.jpeg", "price": 12000},
    {"name": "Boba", "image": "assets/images/boba.jpeg", "price": 15000},
    {"name": "Es Teh", "image": "assets/images/es teh.jpeg", "price": 4000},
    {"name": "Jus Alpukat", "image": "assets/images/jus alpukat.jpeg", "price": 9000},
    {"name": "Jus Jeruk", "image": "assets/images/jus jeruk.jpeg", "price": 8000},
    {"name": "Mie Ayam", "image": "assets/images/mie ayam.jpeg", "price": 12000},
    {"name": "Nasi Goreng", "image": "assets/images/nasi goreng.jpeg", "price": 13000},
    {"name": "Sosis Bakar", "image": "assets/images/sosis bakar.jpeg", "price": 7000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Kantin"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen_ajeng()),
              );
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,          
            crossAxisSpacing: 10,       
            mainAxisSpacing: 10,        
            childAspectRatio: 3/4,      
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  // Foto makanan
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        item["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Nama makanan & harga
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rp ${item["price"]}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tombol tambah
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                        ),
                      ),
                      onPressed: () {
                        // TODO: logika keranjang
                      },
                      child: const Text("Tambah"),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}