
import 'package:book/core/route_name.dart';
import 'package:book/views/home/home.dart';
import 'package:book/views/home/home_binding.dart';
import 'package:book/views/info/info_binding.dart';
import 'package:book/views/read/read.dart';
import 'package:book/views/read/read_binding.dart';
import 'package:book/views/welcome/welcome_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../entities/book_info.dart';
import '../views/info/info.dart';
import '../views/welcome/welcome.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(name: RouteName.welcome, page: () =>  Welcome(),binding: WelcomeBinding()),
    GetPage(name: RouteName.home, page: () =>  Home(), binding: HomeBinding()),
    GetPage(name: RouteName.viewPage, page: () =>  Read(), binding: ReadBinding()),
    GetPage(name: RouteName.bookInfo, page: () =>  Info(), binding: InfoBinding()),
  ];
}

