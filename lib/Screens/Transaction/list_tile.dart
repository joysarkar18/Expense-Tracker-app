import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(
          Icons.arrow_upward_rounded,
          color: Colors.red,
        ),
        title: Text(
          "Today 2:30",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
        subtitle: Text("Ritesh Shandilya",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700)),
        trailing: Text("456rs"),
      ),
    );
  }
}
