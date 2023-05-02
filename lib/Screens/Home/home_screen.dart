import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("user")
                    .doc(_auth.currentUser?.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("lodding");
                  } else {
                    var data = snapshot.data?.data();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello,",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              data!["name"].toString(),
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    Icon(Icons.notification_important_rounded))
                          ],
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
                  ))),
        ],
      ),
    );
  }
}
