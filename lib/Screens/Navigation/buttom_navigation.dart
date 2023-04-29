import 'package:expense_app/Screens/Graph/graph_screen.dart';
import 'package:expense_app/Screens/Home/home_screen.dart';
import 'package:expense_app/Screens/Navigation/buttom_nav_bar.dart';
import 'package:expense_app/Screens/Profile/profile_screen.dart';
import 'package:expense_app/Screens/Transaction/transaction_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ButtomNavigationController extends GetxController {
  final RxInt pageIndex = 0.obs;
  List pageList = [
    HomeScreen(),
    TransactionDcreen(),
    GraphScreen(),
    ProfileScreen()
  ];
}
