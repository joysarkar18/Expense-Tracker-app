import 'package:expense_app/Controller/TransactionController/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  double amount;
  String toWhom;
  int paidOrRecived;
  DateTime dateTime;
  String reason;
  String note;
  TransactionTile(
      {super.key,
      required this.amount,
      required this.toWhom,
      required this.paidOrRecived,
      required this.dateTime,
      required this.reason,
      required this.note});

  @override
  Widget build(BuildContext context) {
    DateTime date = dateTime;
    String formattedDate = DateFormat.yMMMEd().format(date);
    String time = DateFormat.jm().format(
        DateFormat("hh:mm:ss").parse("${dateTime.hour}:${dateTime.minute}:00"));
    print(formattedDate);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: context.isDarkMode ? Colors.white : Colors.grey))),
      child: ListTile(
        leading: paidOrRecived == 0
            ? const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.red,
              )
            : const Icon(
                Icons.arrow_downward_rounded,
                color: Colors.green,
              ),
        title: Text(
          dateTime.day == DateTime.now().day
              ? "Today ${time} ($reason)"
              : dateTime.day == DateTime.now().day - 1
                  ? "Tommrow ${time} ($reason)"
                  : "$formattedDate ${time} ($reason)",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        subtitle: Row(children: [
          Text("$toWhom - ",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Text("$note")
        ]),
        trailing: Text(
          "₹ $amount",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: paidOrRecived == 1 ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}
