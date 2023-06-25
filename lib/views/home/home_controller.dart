import 'dart:async';
import 'dart:convert';

import 'package:book/core/base_controller.dart';
import 'package:book/core/route_name.dart';
import 'package:book/core/string_name.dart';
import 'package:book/entities/book_info.dart';
import 'package:book/views/home/home.components/home.list.search.component.dart';
import 'package:book/views/home/home.interface/home.interface.dart';
import 'package:book/views/home/home.pages/home.info.dart';
import 'package:book/views/home/home.pages/home.list.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class HomeController extends BaseController 
    with GetSingleTickerProviderStateMixin, HomeCallBack {
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
    showEasyLoading();
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
              assetsFile: books[index],
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
    hideEasyLoading();
  }

  Future<void> selectedBook(BookInfo book) async {
    Get.toNamed(RouteName.bookInfo,arguments: [book,null,0] )?.then((value){
      getListFileFromAssetsFolder();
    });
  }

  @override
  void searchCallBack(String search) {
    // TODO: implement searchCallBack
  }

  void searchWidget() {
    if(heightWidgetSearch.value == 0.0){
      heightWidgetSearch.value = 100.0;
      FocusScope.of(Get.context!).requestFocus(focusNode);
    }else{
      heightWidgetSearch.value = 0.0;
      focusNode.unfocus();
    }
  }
  
}
