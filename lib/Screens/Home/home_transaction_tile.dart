import 'package:expense_app/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreenTransactionTile extends StatelessWidget {
  String reason;
  HomeScreenTransactionTile({super.key, required this.reason});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          decoration: const BoxDecoration(
              color: myBlue,
              // image: DecorationImage(
              //     image: NetworkImage(
              //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFIN_HGzza_aVyMoq2zQGRbGkO85NUo2mD1Q&usqp=CAU"),
              // fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 60,
          width: 75,
          child: Lottie.asset("Assets/Lottie/$reason.json"),
        ),
        SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reason,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const Text(
                "Coffee",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        SizedBox(
          width: Get.width * 0.10,
        ),
        const Text(
          "- ₹300",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
