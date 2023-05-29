import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  RxInt paidOrRecived = 0.obs;
  RxInt selectedReason = 1.obs;

  void addTransaction(
    double amount,
  ) async {
    DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .get();

    List transactionsList = [];
    print("hhhhhhhhhhhhhhhhhhhhhh");

    transactionsList = db.data()!["trans"];
    transactionsList.add({"ammount": amount});
    await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .update({"trans": transactionsList});
    print("hiiokojiojd");
  }
}
