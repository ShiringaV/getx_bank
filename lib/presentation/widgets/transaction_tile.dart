import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_bank/consts.dart';
import 'package:getx_bank/data/models/transaction_model.dart';

import '../../app/types/transaction_type.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 22.0),
            transaction.type == TransactionType.pay ? SvgPicture.asset(AppIcons.paymentIconSvg) : SvgPicture.asset(AppIcons.topUpIconSvg),
            const SizedBox(width: 12.0),
            Text(
              transaction.title,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            _getText(transaction, Theme.of(context).textTheme),
            const SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }
}

Widget _getText(TransactionModel transaction, TextTheme theme) {
  if (transaction.type == TransactionType.pay) {
    return RichText(
      text: TextSpan(
        text: transaction.amount.toString(),
        style: const TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w300, color: Colors.black54,
        ),
        children: const [
          TextSpan(
            text: '.00',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  return RichText(
    text: TextSpan(
      text: '+',
      style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: AppColors.primary),
      children: [
        TextSpan(
          text: transaction.amount.toString(),
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: AppColors.primary),
        ),
        const TextSpan(
          text: '.00',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}
