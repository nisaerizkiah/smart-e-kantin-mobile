import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model_kifiyah.dart';

class FirebaseServiceKifiyah {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ---------------------------------
  // REGISTER USER
  // ---------------------------------
  Future<void> registerUser(UserModelKifiyah user) async {
    await _firestore.collection('Users').doc(user.userId).set({
      'user_id': user.userId,
      'name': user.name,
      'email': user.email,
      'password': user.password,
    });
  }

  // ---------------------------------
  // LOGIN AUTH FIREBASE
  // ---------------------------------
  Future<UserCredential> signIn(String email, String password, String nim) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // ---------------------------------
  // GET NIM BY EMAIL
  // ---------------------------------
  Future<String?> getNimByEmail(String email) async {
    final query = await _firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (query.docs.isEmpty) return null;

    final data = query.docs.first.data();

    final nim = data['user_id'] ?? data['nim'] ?? data['userId'];

    if (nim == null) return null;

    return nim.toString();
  }

  Future<void> seedProducts() async {}

  Future<void> updateStockTransaction(Map<String, int> change) async {}

  Future<void> createTransactionRecord(Map<String, Object> trxDoc) async {}

  Future<void> signUp(String email, String password, String nim) async {}
}