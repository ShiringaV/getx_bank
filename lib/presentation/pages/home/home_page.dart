import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bank/app/utils/utils.dart';
import 'package:getx_bank/consts.dart';
import 'package:getx_bank/presentation/controllers/balance_controller.dart';
import 'package:getx_bank/presentation/pages/pay/pay_page.dart';
import 'package:getx_bank/presentation/widgets/bank_icon.dart';
import 'package:getx_bank/presentation/widgets/main_layout.dart';
import 'package:getx_bank/presentation/widgets/transaction_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final BalanceController balanceController = Get.put(BalanceController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MainLayout(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 45.0, bottom: 125.0),
                alignment: Alignment.center,
                color: theme.primaryColor,
                height: 240,
                width: double.infinity,
                child: Obx(
                  () => Utils.valueToWidgetWithFound(
                    balanceController.balance.value,
                    theme: theme,
                  ),
                ),
              ),
              const SizedBox(height: 70.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Recent Activity', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 7.0),
                  SizedBox(
                    width: double.infinity,
                    child: TransactionList(),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 185,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BankIcon(
                    asset: AppIcons.phoneIconSvg,
                    text: 'Pay',
                    onTap: () => Get.to(const PayPage()),
                  ),
                  const SizedBox(width: 24.0),
                  BankIcon(
                    asset: AppIcons.walletIconSvg,
                    text: 'Top up',
                    onTap: () {},
                  ),
                  const SizedBox(width: 24.0),
                  BankIcon(
                    asset: AppIcons.loanIconSvg,
                    text: 'Loan',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
