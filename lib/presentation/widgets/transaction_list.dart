import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bank/presentation/widgets/transaction_tile.dart';
import 'package:intl/intl.dart';

import '../../consts.dart';
import '../controllers/balance_controller.dart';

class TransactionList extends StatelessWidget {
  final BalanceController balanceController = Get.find();

  TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDataTime = DateTime.now();

    return Obx(
      () => ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: balanceController.transactionDataList.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          if (currentDataTime.day != balanceController.transactionDataList[index].date.day || index == 0) {
            currentDataTime = balanceController.transactionDataList[index].date;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    _getDayTitle(currentDataTime),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColors.darkSecond,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                TransactionTile(transaction: balanceController.transactionDataList[index]),
              ],
            );
          }
          return TransactionTile(transaction: balanceController.transactionDataList[index]);
        },
      ),
    );
  }
}

String _getDayTitle(DateTime date) {
  int currentDay = DateTime.now().day;

  int yesterday = DateTime.now().subtract(const Duration(days: 1)).day;

  if (date.day == currentDay) {
    return 'Today';
  }
  if (date.day == yesterday) {
    return 'Yesterday';
  }

  return DateFormat('EEEE, dd.MM').format(date);
}
