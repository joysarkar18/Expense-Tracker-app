import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var data = [0.0, 100.0, 200.0, 155.0, 445.0, 450.0, 1000.0];
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
                            "Hello",
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
                                  data!["name"].toString(),
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
            Container(
              color: Colors.purpleAccent,
              width: Get.width,
              height: 200.0,
              child: Chart(
                layers: [
                  ChartLineLayer(
                    items: [
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                      ChartLineDataItem(value: 200, x: 28),
                    ],
                    settings: const ChartLineSettings(
                        color: Colors.blue, thickness: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
