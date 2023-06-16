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

class Read extends GetView<ReadController>{

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
        title: Text(controller.book.nameBook??''),
        centerTitle: true,
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context){
    return PDFView(
      filePath: controller.book.path,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: true,
      pageFling: true,
      pageSnap: true,
      defaultPage: controller.currentPage,
      fitPolicy: FitPolicy.BOTH,
      preventLinkNavigation: false, // if set to true the link is handled in flutter
      onError: (error){
        controller.alert(content: error.toString());
      },
      onViewCreated: (PDFViewController pdfViewController) {
        controller.pdfController.complete(pdfViewController);
      },
      onRender: (pages){
        controller.toastAlert(content: 'Successfully');
      },
    );
  }
}