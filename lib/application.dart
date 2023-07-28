import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'core/base_binding.dart';
import 'core/route_name.dart';
import 'core/routes.dart';

class Application extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.welcome,
      initialBinding: BaseBinding(),
      getPages: Routes.pages,
    );
  }

}