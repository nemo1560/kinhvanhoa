import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{
  late Size size;

  @override
  void onInit() {
    size = Get.context!.size!;
    super.onInit();
  }
}