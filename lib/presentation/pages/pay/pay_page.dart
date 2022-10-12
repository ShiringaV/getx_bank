import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bank/consts.dart';
import 'package:getx_bank/data/models/transaction_model.dart';
import 'package:getx_bank/presentation/widgets/bank_button.dart';
import 'package:getx_bank/presentation/widgets/main_layout.dart';
import 'package:getx_bank/presentation/widgets/simple_button.dart';

import '../../../app/types/transaction_type.dart';
import '../../../app/utils/utils.dart';
import '../../controllers/balance_controller.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();
  final BalanceController balanceController = Get.find();
  double currentValue = 100.00;

  @override
  void dispose() {
    _pageController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: 16.0,
        ),
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: Row(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'MoneyApp',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => Get.back(),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.close,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32.0),
                  const Text(
                    'How much?',
                    style: TextStyle(fontSize: 25.0, color: AppColors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 32.0),
                  Utils.valueToWidgetWithFound(currentValue, theme: Theme.of(context)),
                  const SizedBox(height: 122.0),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    primary: false,
                    crossAxisSpacing: 64,
                    children: [
                      SimpleTextButton(title: '1', onTap: () {}),
                      SimpleTextButton(title: '2', onTap: () {}),
                      SimpleTextButton(title: '3', onTap: () {}),
                      SimpleTextButton(title: '4', onTap: () {}),
                      SimpleTextButton(title: '5', onTap: () {}),
                      SimpleTextButton(title: '6', onTap: () {}),
                      SimpleTextButton(title: '7', onTap: () {}),
                      SimpleTextButton(title: '8', onTap: () {}),
                      SimpleTextButton(title: '9', onTap: () {}),
                      SimpleTextButton(title: '.', onTap: () {}),
                      SimpleTextButton(title: '0', onTap: () {}),
                      SimpleTextButton(title: '<', onTap: () {}),
                    ],
                  ),
                  const SizedBox(height: 42.0),
                  BankButton(
                    title: 'Next',
                    onTap: () {
                      if (balanceController.balance.value < currentValue) {
                        Get.defaultDialog(
                          title: 'Opppss',
                          middleText: 'There are not enough funds in your account',
                          backgroundColor: AppColors.darkSecond.withOpacity(0.9),
                          titleStyle: const TextStyle(color: AppColors.white),
                          middleTextStyle: const TextStyle(color: AppColors.white),
                          radius: 4.0,
                          textConfirm: 'Okay',
                          confirmTextColor: AppColors.white,
                          onConfirm: () {
                            Get.back();
                          },
                        );
                        return;
                      }
                      _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  'To whom?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.white),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(),
                BankButton(
                  title: 'Pay',
                  onTap: () {
                    balanceController.addNewTransaction(
                        TransactionModel(date: DateTime.now(), type: TransactionType.pay, title: _textEditingController.text, amount: currentValue));
                    balanceController.balance.value -= 100.0;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
