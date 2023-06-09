import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/Controller/ChartController/chart_controller.dart';
import 'package:expense_app/Screens/Home/chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Total Transaction - ₹${chartController.totalAmountThisWeek}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    LinexChart(),
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
                )),
            Center(
              child: IconButton(
                onPressed: () {
                  Authentication.instance.logOut();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
