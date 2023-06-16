import 'package:book/core/uitility.dart';
import 'package:book/views/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeInfo extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utility.size.width,
      height: Utility.size.height,
    );
  }

}