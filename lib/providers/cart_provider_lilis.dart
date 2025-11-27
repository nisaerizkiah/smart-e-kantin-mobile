// lib/providers/cart_provider_lilis.dart
import 'package:flutter/material.dart';
import '../models/product_model_kifiyah.dart';
import '../services/firebase_services_kifiyah.dart';

class CartProviderLilis extends ChangeNotifier {
  final Map<ProductModelKifiyah, int> _items = {};
  String userNim = '';

  Map<ProductModelKifiyah, int> get items => _items;

  int get totalItems => _items.values.fold(0, (a, b) => a + b);

  double get subTotal {
    double s = 0;
    _items.forEach((p, q) {
      s += p.price * q;
    });
    return s;
  }

  double get discountAmount {
    if (userNim.isEmpty) return 0;
    final lastChar = userNim.trim().isNotEmpty ? userNim.trim().substring(userNim.trim().length - 1) : '0';
    final digit = int.tryParse(lastChar) ?? 0;
    if (digit % 2 == 1) {
      // NIM ganjil -> diskon 5%
      return subTotal * 0.05;
    } else {
      // NIM genap -> gratis ongkir (represent as 5000)
      return 5000;
    }
  }

  String get discountDescription {
    if (userNim.isEmpty) return '-';
    final lastChar = userNim.trim().isNotEmpty ? userNim.trim().substring(userNim.trim().length - 1) : '0';
    final digit = int.tryParse(lastChar) ?? 0;
    if (digit % 2 == 1) return '-5% (NIM ganjil)';
    return 'Gratis ongkir (NIM genap)';
  }

  double get totalFinal {
    if (userNim.isEmpty) return subTotal;
    final lastChar = userNim.trim().isNotEmpty ? userNim.trim().substring(userNim.trim().length - 1) : '0';
    final digit = int.tryParse(lastChar) ?? 0;
    if (digit % 2 == 1) {
      return subTotal - discountAmount;
    } else {
      // gratis ongkir: do not subtract from subtotal (we simply show "Gratis ongkir")
      // but keep totalFinal as subtotal (no negative)
      return subTotal;
    }
  }

  void addToCart(ProductModelKifiyah product) {
    if (_items.containsKey(product)) _items[product] = _items[product]! + 1;
    else _items[product] = 1;
    notifyListeners();
  }

  void removeFromCart(ProductModelKifiyah product) {
    if (_items.containsKey(product)) {
      _items.remove(product);
      notifyListeners();
    }
  }

  void increaseQty(ProductModelKifiyah product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
      notifyListeners();
    }
  }

  void decreaseQty(ProductModelKifiyah product) {
    if (!_items.containsKey(product)) return;
    final current = _items[product]!;
    if (current <= 1) _items.remove(product);
    else _items[product] = current - 1;
    notifyListeners();
  }

  Future<bool> checkout() async {
    if (_items.isEmpty) return false;
    try {
      final Map<String, int> change = {};
      _items.forEach((p, q) {
        change[p.productId] = q;
      });

      await FirebaseServiceKifiyah().updateStockTransaction(change);

      final trxDoc = {
        'trx_id': DateTime.now().millisecondsSinceEpoch.toString(),
        'total_final': totalFinal,
        'status': 'Success',
        'items': _items.entries.map((e) => {
          'product_id': e.key.productId,
          'name': e.key.name,
          'price': e.key.price,
          'qty': e.value,
        }).toList(),
        'created_at': DateTime.now().toIso8601String(),
        'user_nim': userNim,
      };

      await FirebaseServiceKifiyah().createTransactionRecord(trxDoc);

      _items.clear();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Checkout error: $e');
      return false;
    }
  }

  void setUserNim(String nim) {
    userNim = nim;
    notifyListeners();
  }
}