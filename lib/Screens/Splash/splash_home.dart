import 'dart:async';

import 'package:expense_app/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 88, 156, 211),
      body: Center(
        child: Container(
          child: Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_06a6pf9i.json',
            width: Get.width * 0.7,
            height: Get.width * 0.7,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
