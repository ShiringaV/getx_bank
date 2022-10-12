import '../../app/types/transaction_type.dart';

class TransactionModel {
  final DateTime date;
  final TransactionType type;
  final String title;
  final double amount;

  TransactionModel({
    required this.date,
    required this.type,
    required this.title,
    required this.amount,
  });
}
