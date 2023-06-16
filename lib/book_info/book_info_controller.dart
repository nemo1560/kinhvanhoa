import 'package:book/core/base_controller.dart';
import 'package:get/get.dart';

import '../entities/book_info.dart';

class BookInfoController extends BaseController{
  late BookInfo book;

  @override
  void onInit() {
    book = Get.arguments[0];
    super.onInit();
  }
}