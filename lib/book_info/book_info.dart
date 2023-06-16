import 'package:book/book_info/book_info_controller.dart';
import 'package:book/core/string_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class BookInfo extends GetView<BookInfoController>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: GFAppBar(
          backgroundColor: GFColors.SUCCESS,
          leading: GFIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
            onPressed: controller.backPressed,
            type: GFButtonType.transparent,
          ),
          searchBar: false,
          title: Text(StringName.infoChapter,style: controller.customStyle(fontSize: 20, color: Colors.white),),
          centerTitle: true,
          actions: <Widget>[
            GFIconButton(
              icon: Icon(
                null,
                color: Colors.white,
              ),
              onPressed: () {

              },
              type: GFButtonType.transparent,
            ),
          ],
        ),
    ), onWillPop: controller.backPressed);
  }

}