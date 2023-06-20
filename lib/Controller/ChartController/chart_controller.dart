import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChartController extends GetxController {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  List transactionList = [];
  var totalAmountThisWeek = 0.0;
  var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  RxBool rebuildHome = false.obs;
  var recentTransactions = [];

  void getTransactionList() async {
    var weektransactionData = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    DocumentSnapshot<Map<String, dynamic>> db = await FirebaseFirestore.instance
        .collection("transactions")
        .doc(firebaseUser?.email.toString().trim())
        .get();

    transactionList = db.data()!["trans"];

    Timestamp first = transactionList[0]["dateTime"];
    DateTime firstDate = first.toDate();
    print("hiiiiiiiiiiiiiiiiii" + firstDate.weekday.toString());

    double total = 0;

    if (firstDate.weekday == 7) {
      var i = 0;
      while (firstDate.weekday == 7) {
        Timestamp f = transactionList[i]["dateTime"];
        firstDate = f.toDate();
        if (transactionList[i]["paidOrRecived"] == 0) {
          total = total + transactionList[i]["ammount"];
          weektransactionData[firstDate.weekday - 1] +=
              transactionList[i]["ammount"];
        }
        i++;
      }
    }
    for (var i = 0; i < transactionList.length; i++) {
      Timestamp f = transactionList[i]["dateTime"];
      firstDate = f.toDate();
      if (firstDate.weekday == 7) {
        break;
      }
      if (transactionList[i]["paidOrRecived"] == 0) {
        total = total + transactionList[i]["ammount"];
        weektransactionData[firstDate.weekday - 1] +=
            transactionList[i]["ammount"];
      }
    }

    print("jahfajkhfdkjfhdsfdfjdk" + total.toString());
    totalAmountThisWeek = total;
    data = weektransactionData;
    rebuildHome.value = !rebuildHome.value;
    if (transactionList.length >= 10) {
      recentTransactions = transactionList.sublist(0, 9);
    } else {
      recentTransactions = transactionList;
    }
  }
}
