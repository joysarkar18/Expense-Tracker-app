import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Controller/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            onPressed: () {
              Authentication.instance.logOut();
            },
            icon: const Icon(
              Icons.cancel_outlined,
            )));
  }
}
