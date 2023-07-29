import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTransaction({
    required String uid,
    required String type,
    String? title,
    String? description,
    String? category,
    required double amount,
    required DateTime date,
  }) async {
    await _firestore.collection(uid).add({
      "type": type,
      "title": title,
      "description": description,
      "category": category,
      "amount": amount,
      "date": date.toIso8601String(),
    });
  }
}
