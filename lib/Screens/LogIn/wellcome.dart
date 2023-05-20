import 'package:expense_app/Screens/LogIn/login_screen.dart';
import 'package:expense_app/Screens/LogIn/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 38),
              const Text("Welcome",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: const Text(
                  "Automatic identity verification which enables you to verify your identy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: const Image(
                      image: AssetImage('Assets/Images/welcomelogo.png'))),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const LoginScreen(),
                        transition: Transition.cupertinoDialog);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text("Sign In",
                          style: TextStyle(fontSize: 16))),
                ),
              ),
              const SizedBox(height: 14),
              const Text("or", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 14),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen(),
                        transition: Transition.cupertinoDialog);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: const Text("Sign Up",
                          style: TextStyle(fontSize: 16))),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
