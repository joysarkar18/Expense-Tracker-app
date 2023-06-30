import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.3,
            decoration: BoxDecoration(color: Colors.purple),
            child: Text("profile"),
          ),
        ],
      ),
    );
  }
}
