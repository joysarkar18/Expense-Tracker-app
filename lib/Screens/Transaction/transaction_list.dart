import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/Controller/TransactionController/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_tile.dart';

class TransList extends StatefulWidget {
  const TransList({super.key});

  @override
  State<TransList> createState() => _TransListState();
}

class _TransListState extends State<TransList> {
  bool loading = true;
  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("transactions")
          .doc(transactionController.firebaseUser?.email.toString().trim())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Center(
            child: Text("hiii"),
          );
        } else {
          return const Center(
            child: Text("hiii no data"),
          );
        }
      },
    );
  }
}
