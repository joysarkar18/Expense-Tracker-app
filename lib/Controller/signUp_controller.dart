import 'package:expense_app/Controller/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Testfield controllers to get data from textfield

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void registerUser(String email, String password) {
    Authentication.instance.createUserWithEmailPassword(email, password);
  }
}
