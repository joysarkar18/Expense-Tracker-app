import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  // add transaction part code is here
  var firebaseUser = FirebaseAuth.instance.currentUser;
  RxInt paidOrRecived = 0.obs;
  RxInt selectedReason = 1.obs;
  var transactionAmount = TextEditingController();
  var transactionWith = TextEditingController();
  var transactionNotes = TextEditingController();
  RxString transactionReason = "Food".obs;

  void addTransaction({
    required int paidOrRec,
    required double amount,
    required String toWhom,
    required String notes,
    required String reason,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .get();

    List transactionsList;

    transactionsList = db.data()!["trans"];
    transactionsList.add({
      "ammount": amount,
      "paidOrRecived": paidOrRec,
      "toWhom": toWhom,
      "notes": notes,
      "reason": reason,
    });
    await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .update({"trans": transactionsList});
  }

  RxInt allPaidRecived = 0.obs;
  var transactionList = [].obs;

  void getTransactionList() async {
    DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .get();

    transactionList.value = db.data()!["trans"];
  }
}
