import 'package:email_validator/email_validator.dart';
import 'package:expense_app/Controller/main_controller.dart';
import 'package:expense_app/Controller/signUp_controller.dart';
import 'package:expense_app/Screens/LogIn/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fromKey = GlobalKey<FormState>();
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void dispose() {
    Authentication.instance.errorMsgup!.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signupController = Get.put(SignupController());
    final MainController mainController = Get.put(MainController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: SafeArea(
              child: Center(
                child: SizedBox(
                  height: Get.height,
                  child: Column(children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: fromKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              child: const Text("Name",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Card(
                              shadowColor: const Color.fromARGB(120, 14, 14, 14),
                              elevation: 6,
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: TextFormField(
                                controller: signupController.nameController,
                                validator: (value) => validateName(value),
                                decoration: const InputDecoration(
                                  hintText: "Enter your Name",
                                  prefixIcon: Icon(
                                    Icons.person_2_rounded,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ),

                            //password
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              child: const Text("Email",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Card(
                              shadowColor: const Color.fromARGB(120, 14, 14, 14),
                              elevation: 6,
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: TextFormField(
                                controller: signupController.emailController,
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? "Enter a valid email"
                                    : null,
                                decoration: const InputDecoration(
                                  hintText: "Enter your Email",
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: Colors.black,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 158, 158, 158))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 12),
                              child: const Text("Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Card(
                              shadowColor: const Color.fromARGB(120, 14, 14, 14),
                              elevation: 6,
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: TextFormField(
                                controller: signupController.passwordController,
                                validator: (value) => validatePassword(value),
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                  hintText: "Enter your Password",
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    color: Colors.black,
                                    onPressed: () => updateStatus(),
                                    icon: Icon(_isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 158, 158, 158))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => Text(
                        Authentication.instance.errorMsgup!.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          final from = fromKey.currentState!;
                          if (from.validate()) {
                            SignupController.instance.registerUser(
                                signupController.emailController.text.trim(),
                                signupController.passwordController.text
                                    .trim());
                            mainController.createUserData(
                                signupController.nameController.text,
                                signupController.emailController.text);
                          }
                        },
                        child: Container(
                            padding: const EdgeInsets.all(16),
                            child: const Text("Sign Up",
                                style: TextStyle(fontSize: 16))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have Account?"),
                        TextButton(
                            onPressed: () {
                              Get.off(() => const LoginScreen());
                            },
                            child: const Text("Sign In"))
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}

String? validatePassword(String? pass) {
  if (pass == null || pass.isEmpty) {
    return "please enter the password";
  }
  if (pass.length < 5) {
    return "password is to short";
  }
  return null;
}

String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return "please enter your Name";
  }
  if (name.length < 3) {
    return "Name is to short";
  }
  return null;
}
