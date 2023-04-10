import 'package:expense_app/Screens/home_screen.dart';
import 'package:expense_app/Screens/wellcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    // Get called after widget is rendered on the screen
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitScreen);
  }

  _setInitScreen(User? user) {
    user == null
        ? Get.offAll(() => WellcomeScreen())
        : Get.offAll(() => Home());
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("error in create");
    }
  }

  Future<void> loginUserWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("error in signin");
    }
  }
}
