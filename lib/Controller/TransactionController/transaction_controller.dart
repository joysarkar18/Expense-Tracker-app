import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var firebaseUser = FirebaseAuth.instance.currentUser;

  void addTransaction(Transaction t) async {
    DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(firebaseUser?.email.toString().trim())
        .get();

    List transactionsList = [];
    if (db.data()!["transactions"] != null) {
      transactionsList = db.data()!["transactions"];
    }
  }
}
