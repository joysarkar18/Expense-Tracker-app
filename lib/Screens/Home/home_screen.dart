import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/Controller/ChartController/chart_controller.dart';
import 'package:expense_app/Screens/Home/chart.dart';
import 'package:expense_app/Screens/Home/home_transaction_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ChartController chartController = Get.put(ChartController());
    chartController.getTransactionList();
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("user")
                      .doc(auth.currentUser?.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text("lodding");
                    } else {
                      var data = snapshot.data?.data();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Hello",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: Get.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ${data!["name"]}",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      size: 34,
                                      Icons.notifications,
                                      color: Color.fromARGB(255, 236, 221, 4),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 10),
              decoration: const BoxDecoration(
                // boxShadow: [BoxShadow(blurRadius: 4)],
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 188, 60, 214),
                    Color.fromARGB(255, 221, 177, 223)
                  ], // Replace with your desired gradient colors
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: Get.height * 0.28,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Current Week",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Obx(
                        () => Text(
                          chartController.rebuildHome.value
                              ? "Total Transaction - ₹${chartController.totalAmountThisWeek}"
                              : "Total Transaction - ₹${chartController.totalAmountThisWeek}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const LinexChart(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mon"),
                      Text("Tue"),
                      Text("Wed"),
                      Text("Thu"),
                      Text("Fri"),
                      Text("Sat"),
                      Text("Sun"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                          fontSize: 16),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 32,
                      color: Colors.grey,
                    )
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              height: Get.height * 0.435,
              child: chartController.recentTransactions.length == 0
                  ? const Center(
                      child: Text("No Recent Transactions"),
                    )
                  : ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: chartController.recentTransactions.length,
                        itemBuilder: (context, index) {
                          return HomeScreenTransactionTile(
                            reason: chartController.recentTransactions[index]
                                ["reason"],
                            amount: chartController.recentTransactions[index]
                                ["ammount"],
                            date: (chartController.recentTransactions[index]
                                    ["dateTime"] as Timestamp)
                                .toDate(),
                            paidOrRecived: chartController
                                .recentTransactions[index]["paidOrRecived"],
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
