import 'package:email_validator/email_validator.dart';
import 'package:expense_app/Controller/authentication.dart';
import 'package:expense_app/Screens/LogIn/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/signUp_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void dispose() {
    Authentication.instance.errorMsg!.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var logInController = Get.put(SignupController());
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
        body: StretchingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: SafeArea(
                child: Center(
                  child: SizedBox(
                    height: Get.height,
                    child: Column(children: [
                      const Text(
                        "Sign In",
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
                                  controller: logInController.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)),
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
                                  controller:
                                      logInController.passwordController,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(13)),
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
                          Authentication.instance.errorMsg!.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      const SizedBox(
                        height: 54,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            final from = fromKey.currentState!;
                            if (from.validate()) {
                              SignupController.instance.loginUser(
                                  logInController.emailController.text.trim(),
                                  logInController.passwordController.text
                                      .trim());
                            }
                          },
                          child: Container(
                              padding: const EdgeInsets.all(16),
                              child: const Text("Sign In",
                                  style: TextStyle(fontSize: 16))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have Account?"),
                          TextButton(
                              onPressed: () {
                                Get.off(() => const SignUpScreen());
                              },
                              child: const Text("Sign Up"))
                        ],
                      ),
                      Container(
                        height: Get.height * 0.25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('Assets/Images/signupback.png'),
                        )),
                      ),
                    ]),
                  ),
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
    return "password can't be to short";
  }
  return null;
}
