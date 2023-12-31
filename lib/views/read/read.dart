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
        title: SizedBox(
          width: 200,
          child: Text(
            controller.book.nameBook ?? '',
            softWrap: false,
            style: controller.defaultStyle(fontSize: 16, color: Colors.white),
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
    ),onWillPop: () async {
      Get.back(result: "result");
      return false;
    },);
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
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              fitEachPage: true,
              nightMode: Utility.isLightTheme.value ? false : true,
              defaultPage: controller.page.value,
              fitPolicy: FitPolicy.BOTH,
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
                controller.showCountPage(page,total);
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
                      child: Container(width: 40,height: 40, padding: EdgeInsets.only(left: 25),child: InkWell(
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
                          child: InkWell(child: Text(
                            '${controller.showPage.value}/${controller.showTotalPage.value}',
                            style: controller.customStyle(
                                fontSize: 20, color: Colors.white),
                          ),onTap: (){
                            controller.toPage();
                          }),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Visibility(child: Container(width: 40,height: 40, padding: EdgeInsets.only(right: 25),child: InkWell(
                      child: Obx(() => Icon(
                        controller.darkMode.value ? Icons.light_mode : Icons.dark_mode,
                        size: 20,
                        color: Colors.white,
                      )),
                      onTap: (){
                        if(!Get.isRegistered<ReadController>()){
                          Get.lazyPut(() => ReadController());
                        }
                        controller.setDarkMode();
                      },
                    ),),visible: false,
                  ))
                ],
              ))
        ],
      ),
    ));
  }
}
