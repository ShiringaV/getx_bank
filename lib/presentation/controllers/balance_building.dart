import 'package:get/get.dart';
import 'package:getx_bank/presentation/controllers/balance_controller.dart';

class BalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BalanceController(), permanent: true);
  }
}