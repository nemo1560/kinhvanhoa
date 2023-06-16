import 'package:book/core/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseController extends GetxController{
  GetStorage bookMarkStorage = GetStorage();
  final iconList = <IconData>[
    Icons.book_online_rounded,
    Icons.history,
    Icons.info,
  ];

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  configLoading() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  Future<void> showEasyLoading() async {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    EasyLoading.show();
  }

  Future<void> hideEasyLoading() async {
    EasyLoading.dismiss();
  }

  Future<bool> backPressed() async {
    Get.back(result: "result");
    return false;
  }

  Future<void> closeDialog() async {
    Get.back();
    backPressed();
  }

  tooltipCustom({required Widget content}) async {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(2),
      barrierDismissible: true,
      onWillPop: () async {
        return false;
      },
      titlePadding: EdgeInsets.only(top: 20),
      content: content ??
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Not found widget !",
              style: TextStyle(color: Colors.red.shade500),
            ),
          ),
    );
  }

  alert({required String content}) async {
    Get.defaultDialog(
        title: "Thông báo",
        titlePadding: const EdgeInsets.only(top: 20),
        barrierDismissible: false,
        content: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              content,
              softWrap: true,
              overflow: TextOverflow.fade,
            )),
        textCancel: "Ok");
  }

  confirm({required String content, required Function() functionOk}) async {
    Get.defaultDialog(
      title: "Thông báo",
      barrierDismissible: false,
      titlePadding: EdgeInsets.only(top: 20),
      content: Padding(padding: EdgeInsets.all(10), child: Text(content)),
      textCancel: "Cancel",
      textConfirm: "Ok",
      onConfirm: functionOk,
    );
  }

  confirmCustom(
      {String title = "Thông báo",
        required Widget content,
        required Function() functionOk,
        required Function() functionCancel}) async {
    Get.defaultDialog(
      title: title,
      titlePadding: EdgeInsets.only(top: 20),
      barrierDismissible: false,
      content: content ??
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Not found widget !",
              style: TextStyle(color: Colors.red.shade500),
            ),
          ),
      textCancel: "Cancel",
      textConfirm: "Ok",
      onConfirm: functionOk,
      onCancel: functionCancel,
    );
  }



  TextStyle customStyle({required double fontSize, required Color color, int bold = 0}){
    return GoogleFonts.orbitron(
      fontSize: fontSize,
      color: color,
      fontWeight: bold == 0 ? FontWeight.normal : FontWeight.bold,
    );
  }

  TextStyle defaultStyle({double fontSize = 12.0, required Color color, int bold = 0}){
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold == 0 ? FontWeight.normal : FontWeight.bold,
    );
  }

  void toastAlert({required String content}){
    GFToast.showToast(content, Get.context!,toastBorderRadius: 10.0,toastPosition: GFToastPosition.BOTTOM);
  }
}