import 'package:book/views/home/home.interface/home.interface.dart';
import 'package:book/views/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}