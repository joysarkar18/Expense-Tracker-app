import 'package:expense_app/Screens/Transaction/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 38,
        // ),
        // Container(
        //     margin: const EdgeInsets.only(left: 5),
        //     child: const Text("Transactions List",
        //         style: TextStyle(fontSize: 24))),
        // const SizedBox(
        //   height: 15,
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              width: 50,
              child: const Text(
                "All",
                style: TextStyle(fontSize: 22),
              )),
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              width: 140,
              child:
                  const Text("Transactions", style: TextStyle(fontSize: 22))),
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              width: 105,
              child: InkWell(
                  onTap: () {},
                  child:
                      const Text("Expenses", style: TextStyle(fontSize: 22)))),
        ]),
        SizedBox(
          height: Get.height * 0.77,
          child: ListView(
            children: const [
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
              TransactionTile(),
            ],
          ),
        )
      ],
    );
  }
}
