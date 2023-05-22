import 'package:expense_app/Constant/constant.dart';
import 'package:expense_app/Screens/Navigation/buttom_navigation.dart';
import 'package:expense_app/widgets/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    ButtomNavigationController navcontroller = ButtomNavigationController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: Center(
      //     child: IconButton(
      //         onPressed: () {
      //           Authentication.instance.logOut();
      //         },
      //         icon: Icon(
      //           Icons.cancel_outlined,
      //         ))),

      body: Stack(children: [
        Obx(
          () => navcontroller.pageList[navcontroller.pageIndex.value],
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 50,
              width: Get.width,
              child: Stack(children: [
                CustomPaint(
                  size: Size(Get.width, 50),
                  painter: JoyCustomPainter(),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              navcontroller.pageIndex.value = 0;
                            },
                            icon: Icon(
                              Icons.home_filled,
                              color: navcontroller.pageIndex.value == 0
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              navcontroller.pageIndex.value = 1;
                            },
                            icon: Icon(
                              Icons.swap_horizontal_circle,
                              color: navcontroller.pageIndex.value == 1
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) {
                                return const AddTransactionAlert();
                              },
                            );
                          },
                          child: const SizedBox(
                            height: 100,
                            width: 100,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              navcontroller.pageIndex.value = 2;
                            },
                            icon: Icon(
                              Icons.signal_cellular_alt_rounded,
                              color: navcontroller.pageIndex.value == 2
                                  ? Colors.purple
                                  : Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              navcontroller.pageIndex.value = 3;
                            },
                            icon: Icon(
                              Icons.person,
                              color: navcontroller.pageIndex.value == 3
                                  ? Colors.purple
                                  : Colors.blue,
                            ))
                      ],
                    )),
                Center(
                  heightFactor: 0.05,
                  child: SizedBox(
                    height: Get.width * 0.13,
                    width: Get.width * 0.13,
                    child: FloatingActionButton(
                      backgroundColor: Colors.cyan,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (builder) {
                            return const AddTransactionAlert();
                          },
                        );
                      },
                      child:
                          Lottie.asset("Assets/Lottie/127657-add-button.json"),
                    ),
                  ),
                ),
              ]),
            )),
      ]),
    );
  }
}

class JoyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = myBlue
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(Get.width * 0.03, 0, Get.width * 0.10, 0);
    path.lineTo(Get.width * 0.42, 0);

    path.arcToPoint(Offset(Get.width * 0.58, 0),
        radius: const Radius.circular(10), clockwise: false);
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
