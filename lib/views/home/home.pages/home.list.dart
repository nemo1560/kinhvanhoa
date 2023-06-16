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
        child: InkWell(
          child: GFBorder(
            radius: Radius.circular(10),
            color: Colors.greenAccent.shade700,
            dashedLine: [2, 0],
            type: GFBorderType.rRect,
            padding: EdgeInsets.all(5),
            child: Container(
                height: 80,
                width: Utility.size.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              'Tập truyện',
                              style: controller.defaultStyle(
                                  fontSize: 10, color: Colors.black, bold: 1),
                            )),
                            Expanded(
                                child: Text(
                              'Tác giả',
                              style: controller.defaultStyle(
                                  fontSize: 10, color: Colors.black, bold: 1),
                            )),
                            Expanded(
                                child: Text(
                              'Tập',
                              style: controller.defaultStyle(
                                  fontSize: 10, color: Colors.black, bold: 1),
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              book.nameBook ?? '',
                              softWrap: true,
                              style:
                                  controller.defaultStyle(color: Colors.black),
                            )),
                            Expanded(
                                child: Text(
                              book.actor ?? '',
                              style:
                                  controller.defaultStyle(color: Colors.black),
                            )),
                            Expanded(
                                child: Text(
                              book.chapter.toString() ?? '',
                              style:
                                  controller.defaultStyle(color: Colors.black),
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Stack(children: [
                          Align(alignment: Alignment.center,child: Center(
                            child: Icon(
                              Icons.auto_stories_rounded,
                              size: 40,
                              color: Colors.lightGreenAccent.shade700,
                            ),
                          ),),
                          Visibility(visible: book.haveBookMark, child: Positioned(
                            right: 0,
                            top: 0,
                            child: Icon(Icons.bookmark_add_rounded,size: 20,color: Colors.red,),
                          ))
                        ],)
                      ),
                    ],
                  ),
                )),
          ),
          onTap: () {
            controller.startView(book);
          },
        ));
  }
}
