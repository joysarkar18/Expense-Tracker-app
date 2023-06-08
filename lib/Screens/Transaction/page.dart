import 'package:expense_app/Controller/TransactionController/transaction_controller.dart';
import 'package:expense_app/Screens/Transaction/list_tile.dart';
import 'package:expense_app/Screens/Transaction/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TransactionController transactionController =
      Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 55,
        ),
        Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text("  Transactions List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800))),
        const SizedBox(
          height: 15,
        ),
        Obx(
          () =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                transactionController.allPaidRecived.value = 0;
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  width: 50,
                  decoration: BoxDecoration(
                      color: transactionController.allPaidRecived.value == 0
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "All",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                transactionController.allPaidRecived.value = 1;
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: transactionController.allPaidRecived.value == 1
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 80,
                  child: const Center(
                      child: Text("Paid", style: TextStyle(fontSize: 20)))),
            ),
            InkWell(
              onTap: () {
                transactionController.allPaidRecived.value = 2;
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: transactionController.allPaidRecived.value == 2
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 100,
                  child: const Center(
                      child: Text("Recived", style: TextStyle(fontSize: 20)))),
            ),
          ]),
        ),
        SizedBox(
          height: Get.height * 0.76,
          child: const TransList(),
        )
      ],
    );
  }
}
