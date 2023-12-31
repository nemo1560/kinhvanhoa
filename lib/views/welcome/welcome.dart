import 'package:book/core/string_name.dart';
import 'package:book/core/uitility.dart';
import 'package:book/views/welcome/welcome_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/getwidget.dart';

import '../../core/base_controller.dart';

class Welcome extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    Utility.size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: body(context),
        ),
        onWillPop: null);
  }

  Widget body(BuildContext context) {
    return Container(
      width: Utility.size.width,
      height: Utility.size.height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              StringName.appTitle,
              style: controller.customStyle(
                  fontSize: GFSize.LARGE, color: GFColors.FOCUS, bold: 1),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20,bottom: 20),child: Align(
            alignment: Alignment.bottomRight,
            child: Text(StringName.developInfo,style: controller.customStyle(fontSize: 14, color: Colors.black),),
          ),)
        ],
      ),
    );
  }
}
