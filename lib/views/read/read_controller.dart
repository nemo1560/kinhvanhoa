import 'dart:async';
import 'dart:io';

import 'package:book/core/base_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../entities/book_info.dart';

class ReadController extends BaseController{
  late int currentPage;
  late BookInfo book;
  final Completer<PDFViewController> pdfController = Completer<PDFViewController>();
  RxString path = ''.obs;

  @override
  Future<void> onInit() async {
    book = Get.arguments[0];
    currentPage = 0;
    super.onInit();
  }


}