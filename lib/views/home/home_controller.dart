import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:book/core/base_controller.dart';
import 'package:book/core/route_name.dart';
import 'package:book/core/string_name.dart';
import 'package:book/entities/book_info.dart';
import 'package:book/views/home/home.pages/home.info.dart';
import 'package:book/views/home/home.pages/home.list.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:getwidget/getwidget.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  List<Widget> pages = List.empty(growable: true);
  List<TabItem> lstPage = List.empty(growable: true);
  RxList<BookInfo> lstBook = RxList.empty(growable: true);
  late TabController tabController;

  @override
  void onInit() {
    lstPage.add(TabItem(
        title: StringName.homeList,
        icon: Icons.menu_book,
        activeIcon: Icons.menu_book,
        isIconBlend: true));
    lstPage.add(TabItem(
        title: StringName.info,
        icon: Icons.phone,
        activeIcon: Icons.phone,
        isIconBlend: true));
    pages.add(HomeList());
    pages.add(HomeInfo());
    tabController = TabController(length: pages.length, vsync: this);
    getListFileFromAssetsFolder();
    super.onInit();
  }

  void tabSelect(int index) {
    switch (index) {
      case 0:
        getListFileFromAssetsFolder();
        break;
      case 1:
        break;
      default:
        getListFileFromAssetsFolder();
    }
  }

  Future<void> getListFileFromAssetsFolder() async {
    lstBook.clear();
    final manifestJson = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    List books = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets/books'))
        .toList();

    if(books.isNotEmpty){
      int index = 0;
      while(index <= books.length){
        try{
          int id = index;
          BookInfo book = BookInfo(
              nameBook: books[index].replaceAll('assets/books/','').replaceAll('kinh_van_hoa_','').replaceAll('__nguyen_nhat_anh','').replaceAll('.pdf', '').toString(),
              actor: 'Nguyễn Nhật Ánh',
              chapter: ++id,
              path: books[index],
              iconId: 0xe0ef);
          int page = bookMarkStorage.read('chapter_'+book.chapter.toString());
          book.haveBookMark = book.getBookMark(page);
          lstBook.add(book);
        }catch(e){
          print('error: '!+e.toString());
        }
        index++;
      }
    }
    lstBook.refresh();
  }

  Future<void> startView(BookInfo book) async {
    showEasyLoading();
    await fromAsset(book.path!,book.nameBook!+'.pdf').then((value){
      hideEasyLoading();
      if(value.path.isNotEmpty){
        book.path = value.path;
        Get.toNamed(RouteName.viewPage,arguments: [book],preventDuplicates: false)?.then((value) => getListFileFromAssetsFolder());
      }
    });
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
    } catch (e) {
      toastAlert(content: e.toString());
    }
    return completer.future;
  }
}
