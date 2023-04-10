import 'package:expense_app/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = _isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Center(
          child: SafeArea(
            child: Center(
              child: Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: const Text("Email",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Card(
                          shadowColor: Color.fromARGB(120, 14, 14, 14),
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your Email",
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),

                        //password
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text("Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Card(
                          shadowColor: Color.fromARGB(120, 14, 14, 14),
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: TextField(
                            obscureText: _isVisible ? false : true,
                            decoration: InputDecoration(
                              hintText: "Enter your Password",
                              prefixIcon: Icon(
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
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 158, 158, 158))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 54,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginScreen());
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
                      Text("Don't have Account?"),
                      TextButton(onPressed: () {}, child: Text("Sign Up"))
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('Assets/Images/backpic.png'),
                    )),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
