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
          List transactionList = snapshot.data?.data()!["trans"];

          if (transactionList.isEmpty) {
            return const Center(
              child: Text("Don't have any Transactions yet"),
            );
          } else {
            return ListView.builder(
              itemCount: transactionList.length,
              itemBuilder: (context, index) {
                if (transactionController.allPaidRecived.value == 0) {
                  return TransactionTile(
                    amount: double.parse(
                        transactionList[index]["ammount"].toString()),
                    toWhom: transactionList[index]["toWhom"],
                    paidOrRecived: transactionList[index]["paidOrRecived"],
                    dateTime: (transactionList[index]["dateTime"] as Timestamp)
                        .toDate(),
                    reason: transactionList[index]["reason"],
                    note: transactionList[index]["notes"],
                  );
                } else if (transactionController.allPaidRecived.value == 1) {
                  if (transactionList[index]["paidOrRecived"] == 0) {
                    return TransactionTile(
                      amount: double.parse(
                          transactionList[index]["ammount"].toString()),
                      toWhom: transactionList[index]["toWhom"],
                      paidOrRecived: transactionList[index]["paidOrRecived"],
                      dateTime:
                          (transactionList[index]["dateTime"] as Timestamp)
                              .toDate(),
                      reason: transactionList[index]["reason"],
                      note: transactionList[index]["notes"],
                    );
                  }
                } else {
                  if (transactionList[index]["paidOrRecived"] == 1) {
                    return TransactionTile(
                      amount: double.parse(
                          transactionList[index]["ammount"].toString()),
                      toWhom: transactionList[index]["toWhom"],
                      paidOrRecived: transactionList[index]["paidOrRecived"],
                      dateTime:
                          (transactionList[index]["dateTime"] as Timestamp)
                              .toDate(),
                      reason: transactionList[index]["reason"],
                      note: transactionList[index]["notes"],
                    );
                  }
                }
              },
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
