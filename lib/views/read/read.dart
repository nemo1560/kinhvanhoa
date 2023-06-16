import 'package:book/core/uitility.dart';
import 'package:book/entities/book_info.dart';
import 'package:book/views/read/read_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/types/gf_button_type.dart';

class Read extends GetWidget<ReadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: SizedBox(
          width: 200,
          child: Text(
            controller.book.nameBook ?? '',
            softWrap: false,
            style: controller.customStyle(fontSize: 10, color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.bookmark_add_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              controller.createBookMark(page: controller.page.value, index: controller.book.chapter!);
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
        child: Container(
      width: Utility.size.width,
      height: Utility.size.height,
      child: Column(
        children: [
          Expanded(
            child: Obx(() => PDFView(
              filePath: controller.book.path,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              fitEachPage: true,
              nightMode: controller.darkMode.value,
              defaultPage: controller.pageBooked.value,
              fitPolicy: FitPolicy.WIDTH,
              preventLinkNavigation: false,
              // if set to true the link is handled in flutter
              onError: (error) {
                controller.alert(content: error.toString());
              },
              onViewCreated: (PDFViewController pdfViewController) async {
                if(!controller.completePdfViewController.isCompleted){
                  controller.completePdfViewController.complete(pdfViewController);
                  controller.pdfViewController = pdfViewController;
                  controller.getInfoTotalPage();
                }
              },
              onRender: (pages) {
                controller.toastAlert(content: 'Successfully');
              },
              onPageChanged: (page, total) {
                if(!Get.isRegistered<ReadController>()){
                  Get.lazyPut(() => ReadController());
                }
                controller.page.value = page!;
                controller.totalPage.value = total!;
              },
            ),
          )),
          Container(
              height: 50,
              width: Utility.size.width,
              decoration: BoxDecoration(color: GFColors.SUCCESS,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 0.65)
                  )
                ],
              ),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(padding: EdgeInsets.only(left: 10),child: InkWell(
                        child: Obx(() => Icon(
                          controller.bookMark.value ? Icons.bookmark : null,
                          size: 20,
                          color: Colors.white,
                        )),
                        onTap: (){
                          if(!Get.isRegistered<ReadController>()){
                            Get.lazyPut(() => ReadController());
                          }
                          controller.toPageBooked();
                        },
                      ),)
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () => Center(
                          child: Text(
                        '${controller.page}/${controller.totalPage}',
                        style: controller.customStyle(
                            fontSize: 15, color: Colors.white),
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(padding: EdgeInsets.only(right: 10),child: InkWell(
                      child: Obx(() => Icon(
                        controller.darkMode.value ? Icons.dark_mode : Icons.light_mode,
                        size: 20,
                        color: Colors.white,
                      )),
                      onTap: (){
                        if(!Get.isRegistered<ReadController>()){
                          Get.lazyPut(() => ReadController());
                        }
                        controller.setDarkMode();
                      },
                    ),)
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
