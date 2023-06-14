import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kinhvanhoa/core/route_name.dart';
import '../views/welcome.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(name: RouteName.welcome, page: () =>  Welcome()),
  ];
}

