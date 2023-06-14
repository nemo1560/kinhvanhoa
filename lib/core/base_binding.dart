import 'package:get/get.dart';
import 'package:kinhvanhoa/core/base_controller.dart';

class BaseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(),fenix: true);
  }

}