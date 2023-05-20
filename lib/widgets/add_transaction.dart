import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionAlert extends StatefulWidget {
  const AddTransactionAlert({Key? key}) : super(key: key);

  @override
  State<AddTransactionAlert> createState() => _AddTransactionAlertState();
}

class _AddTransactionAlertState extends State<AddTransactionAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(20),
            height: 440,
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Enter Transaction Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          // mainController.doctorOrMother.value = 0;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: 0 == 0
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container(),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "paid",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // mainController.doctorOrMother.value = 1;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: 1 == 1
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.purple,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container(),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Recived",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" Enter Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 60,
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 20),
                          Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: const Center(
                              child: Text(
                                "₹",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  color: Color.fromARGB(255, 248, 56, 255),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(" Select Reasone",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    _compilationListTile(),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 40, 236, 5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "Submit".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Widget _compilationListTile() {
  List<String> complications = <String>[
    "High Blood Pressure",
    "Gestational Diabetes",
    "Preeclampsia",
    "Preterm labor",
    "Loss of pregnancy, or Miscarriage",
    "Diabetes",
    "Cancer",
    "Infections",
    "Sexually Transmitted Diseases, including HIV",
    "Kidney Problems",
    "Epilepsy",
    "Anemia",
    "Pregnant at 35 or Older",
    "Pregnant at Young Age",
    "Smoking Cigarettes",
    "Using Illegal Drugs",
    "Drinking Alcohol",
    "Carrying Multiples, such as Twins or Triplets"
  ];

  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: ExpansionTile(
          textColor: Colors.black,
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          collapsedTextColor: Colors.black,
          title: const Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          children: [
            Container(
              height: 250,
              width: 200,

              // color: Colors.red,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: ListView.builder(
                  itemCount: complications.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(12),
                            child: Text(complications[index])),
                      )),
            ),
          ],
        ),
      ),
      Container(
        height: 55,
        width: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          cursorColor: Colors.black,
          //controller: mainController.motherDoctorHospitalController,
          decoration: const InputDecoration(
            hintText: "write or select",
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}
