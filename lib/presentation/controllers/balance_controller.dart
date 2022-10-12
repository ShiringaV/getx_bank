import 'package:get/get.dart';
import '../../app/types/transaction_type.dart';
import '../../data/models/transaction_model.dart';

class BalanceController extends GetxController {
  var balance = 150.25.obs;

  final RxList<TransactionModel> _data = [
    TransactionModel(date: DateTime.now(), type: TransactionType.pay, title: 'eBay', amount: 100),
    TransactionModel(date: DateTime.now(), type: TransactionType.pay, title: 'Merton Council', amount: 100),
    TransactionModel(date: DateTime.now(), type: TransactionType.topUp, title: 'Top Up', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 1)), type: TransactionType.pay, title: 'Amazon', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 1)), type: TransactionType.pay, title: 'John Snow.', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 1)), type: TransactionType.topUp, title: 'Top Up', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 1)), type: TransactionType.topUp, title: 'Top Up', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 2)), type: TransactionType.topUp, title: 'Top Up', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 2)), type: TransactionType.topUp, title: 'Top Up', amount: 100),
    TransactionModel(date: DateTime.now().subtract(const Duration(days: 4)), type: TransactionType.topUp, title: 'Top Up', amount: 100),
  ].obs;

  get transactionDataList => _data;

  void addNewTransaction(TransactionModel transaction) {
    _data.insert(0, transaction);
    _data.refresh();
  }
}