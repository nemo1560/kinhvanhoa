import 'dart:async';
import 'dart:io';

import 'package:book/core/base_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/route_name.dart';
import '../../core/uitility.dart';
import '../../entities/book_info.dart';

class InfoController extends BaseController{
  late BookInfo book;
  late String url;
  String imageCache = 'MemoryUsage';

  @override
  void onInit() {
    book = Get.arguments[0];
    url = Utility.urlImage+book.nameBook!+'__nguyen_nhat_anh.jpg';
    print(url);
    super.onInit();
  }
  @override
  void dispose() {
    clearMemoryImageCache(imageCache);
    super.dispose();
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getExternalStorageDirectory();
      File file = File("${dir?.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      return completer.future;
    } catch (e) {
      toastAlert(content: e.toString());
      return new File('');
    }
  }

  Future<void> readBook() async {
    showEasyLoading();
    await fromAsset(book.assetsFile!,book.nameBook!+'.pdf').then((value){
      hideEasyLoading();
      if(value.path.isNotEmpty){
        book.path = value.path;
        Get.toNamed(RouteName.viewPage,arguments: [book,null,0]);
      }
    });
  }
}