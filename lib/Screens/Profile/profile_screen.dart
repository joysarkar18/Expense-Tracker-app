import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width,
      child: Row(children: [
        Container(
          height: 300,
          color: Colors.purple,
        )
      ]),
    );
  }
}
