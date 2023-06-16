import 'package:book/entities/book_info.dart';
import 'package:book/views/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/types/gf_border_type.dart';

import '../../../core/uitility.dart';

class HomeList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utility.size.width,
      height: Utility.size.height,
      child: Obx(() => ListView.builder(
            itemCount: controller.lstBook.length,
            itemBuilder: (buildContext, index) {
              return itemBook(
                  index: index,
                  length: controller.lstBook.length,
                  book: controller.lstBook[index]);
            },
          )),
    );
  }

  Widget itemBook(
      {required int index, required int length, required BookInfo book}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(child: GFBorder(
        radius: Radius.circular(10),
        color: Colors.greenAccent.shade700,
        dashedLine: [2, 0],
        type: GFBorderType.rRect,
        padding: EdgeInsets.all(5),
        child: Container(
          height: 100,
          width: Utility.size.width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.greenAccent.shade100,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Expanded(flex: 1,child: Center(),),
              Expanded(flex: 9,child: Text(book.nameBook!),),
            ],
          ),
        ),
      ),onTap: (){
        controller.startView(book);
      },
    ));
  }
}
