import 'dart:ffi';

class Transaction {
  final String toWhom;
  final Double amount;
  final bool type;

  Transaction({required this.amount, required this.toWhom, required this.type});
}
