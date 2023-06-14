import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kinhvanhoa/core/base_binding.dart';
import 'package:kinhvanhoa/core/route_name.dart';

import 'core/routes.dart';

class Application extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.welcome,
      initialBinding: BaseBinding(),
      getPages: Routes.pages,
    );
  }

}