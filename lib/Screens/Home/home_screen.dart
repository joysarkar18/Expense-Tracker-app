import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_app/Screens/Home/chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
              decoration: const BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 4)],
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 171, 36, 197),
                    Color.fromARGB(255, 238, 119, 244)
                  ], // Replace with your desired gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: Get.height * 0.28,
              width: Get.width,
              child: const LinexChart(isShowingMainData: true),
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
          ],
        ),
      ),
    );
  }
}
