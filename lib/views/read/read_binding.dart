import 'package:book/views/read/read_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ReadBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReadController>(() => ReadController());
  }

}