import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  createUserData(String name, String email) async {
    await _db.collection("user").doc(email).set({"name": name});
  }
}
