import 'package:expense_app/Screens/Graph/graph_screen.dart';
import 'package:expense_app/Screens/Home/home_screen.dart';
import 'package:expense_app/Screens/Profile/profile_screen.dart';
import 'package:expense_app/Screens/Transaction/transaction_screen.dart';
import 'package:get/get.dart';

class ButtomNavigationController extends GetxController {
  final RxInt pageIndex = 0.obs;
  List pageList = [
    const HomeScreen(),
    const TransactionDcreen(),
  ];
}
