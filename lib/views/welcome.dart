import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kinhvanhoa/core/base_controller.dart';

class Welcome extends GetView<BaseController>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: body(context),
    ), onWillPop: null);
  }
  
  Widget body(BuildContext context){
    return Container(
      width: controller.size.width,
      height: controller.size.height,
    );
  }
}