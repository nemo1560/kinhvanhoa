import 'dart:async';
import 'dart:io';

import 'package:book/core/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '../../core/route_name.dart';
import '../../entities/book_info.dart';

class ReadController extends BaseController{
  late BookInfo book;
  final Completer<PDFViewController> completePdfViewController = Completer<PDFViewController>();
  RxString path = ''.obs;
  RxInt page = 1.obs;
  RxInt totalPage = 0.obs;
  RxBool darkMode = false.obs;
  RxBool bookMark = false.obs;
  RxInt pageBooked = 1.obs;
  late PDFViewController pdfViewController;

  @override
  Future<void> onInit() async {
    book = Get.arguments[0];
    initBookMark();
    if(Get.arguments[1] != null){
      darkMode.value = true;
    }
    if(Get.arguments[2] != null){
      int? pageBookMark = bookMarkStorage.read('chapter_'+book.chapter.toString());
      if(pageBookMark != null){
        pageBooked.value = pageBookMark;
        page.value = pageBooked.value;
      }else{
        pageBooked.value = Get.arguments[2];
        page.value = Get.arguments[2];
      }
    }
    super.onInit();
  }

  void initBookMark(){
    int? pageBookMark = bookMarkStorage.read('chapter_'+book.chapter.toString());
    if(pageBookMark != null){
      bookMark.value = true;
    }else{
      bookMark.value = false;
    }
  }

  createBookMark({required int page, required int index}){
    bookMarkStorage.write('chapter_'+index.toString(), page);
    toastAlert(content: "Đã bookmark");
    initBookMark();
  }

  toPageBooked(){
    int? pageBookMark = bookMarkStorage.read('chapter_'+book.chapter.toString());
    pageBooked.value = pageBookMark!;
    bookMarkStorage.remove('chapter_'+book.chapter.toString());
    initBookMark();
    rebuildAllChildren(Get.context!);
  }

  setDarkMode(){
    if(darkMode.value){
      darkMode.value = false;
    }else{
      darkMode.value = true;
    }
    rebuildAllChildren(Get.context!);
  }

  rebuildAllChildren(BuildContext context) {
    this.onDelete();
    if(darkMode.value){
      Get.offAndToNamed(RouteName.viewPage,arguments: [book,true,page.value]);
    }else{
      Get.offAndToNamed(RouteName.viewPage,arguments: [book,null,page.value]);
    }
  }

  Future<void> getInfoTotalPage() async {
    totalPage.value = (await pdfViewController.getPageCount())!;
    page.value = (await pdfViewController.getCurrentPage())!;
  }
}