import 'package:flutter/material.dart';
import 'package:getx_bank/consts.dart';

class BankButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BankButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 60.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white.withOpacity(0.5),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
