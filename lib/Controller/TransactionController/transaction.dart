import 'dart:ffi';

class Transaction {
  final DateTime date;
  final String toWhom;
  final Double amount;
  final bool type;

  Transaction(
      {required this.date,
      required this.amount,
      required this.toWhom,
      required this.type});
}
