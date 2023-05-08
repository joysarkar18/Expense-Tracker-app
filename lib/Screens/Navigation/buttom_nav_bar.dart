import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expense_app/Constant/constant.dart';
import 'package:expense_app/Controller/authentication.dart';
import 'package:expense_app/Screens/Navigation/buttom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    ButtomNavigationController _navcontroller = ButtomNavigationController();
    return Scaffold(
      // body: Center(
      //     child: IconButton(
      //         onPressed: () {
      //           Authentication.instance.logOut();
      //         },
      //         icon: Icon(
      //           Icons.cancel_outlined,
      //         ))),

      body: Stack(children: [
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 50,
              width: Get.width,
              child: Stack(children: [
                CustomPaint(
                  size: Size(Get.width, 50),
                  painter: JoyCustomPainter(),
                ),
                Center(
                  heightFactor: 0.05,
                  child: FloatingActionButton(
                    backgroundColor: Colors.cyan,
                    elevation: 2,
                    onPressed: () {},
                    child: Lottie.asset("Assets/Lottie/127657-add-button.json"),
                  ),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              _navcontroller.pageIndex.value = 0;
                            },
                            icon: Icon(
                              Icons.home_filled,
                              color: _navcontroller.pageIndex.value == 0
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              _navcontroller.pageIndex.value = 1;
                            },
                            icon: Icon(
                              Icons.swap_horizontal_circle,
                              color: _navcontroller.pageIndex.value == 1
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        const SizedBox(
                          width: 14,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        IconButton(
                            onPressed: () {
                              _navcontroller.pageIndex.value = 2;
                            },
                            icon: Icon(
                              Icons.signal_cellular_alt_rounded,
                              color: _navcontroller.pageIndex.value == 2
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              _navcontroller.pageIndex.value = 3;
                            },
                            icon: Icon(
                              Icons.person,
                              color: _navcontroller.pageIndex.value == 3
                                  ? Colors.purple
                                  : Colors.blue,
                            ))
                      ],
                    ))
              ]),
            )),
        Obx(
          () => _navcontroller.pageList[_navcontroller.pageIndex.value],
        )
      ]),
    );
  }
}

class JoyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = myBlue
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(Get.width * 0.03, 0, Get.width * 0.10, 0);
    path.lineTo(Get.width * 0.42, 0);

    path.arcToPoint(Offset(Get.width * 0.58, 0),
        radius: Radius.circular(10), clockwise: false);
    path.lineTo(Get.width * 0.90, 0);
    path.quadraticBezierTo(Get.width * 0.97, 0, Get.width, 20);
    path.lineTo(Get.width, Get.height);
    path.lineTo(0, Get.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}