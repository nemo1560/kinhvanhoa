import 'package:book/core/base_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/route_name.dart';

class WelcomeController extends BaseController{
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // Get.offNamed(RouteName.home);
    goToHome();
    super.onReady();
  }

  Future<bool> checkPermission() async {
    bool eStatus = true;
    List<Permission> permissions = List.empty(growable: true);
    permissions.addAll([
      Permission.storage,
      Permission.notification
      //Permission.manageExternalStorage
    ]);

    for (Permission permission in permissions) {
      var status = await permission.status;
      if (!status.isGranted) {
        var reStatus = await permission.request();
        if (!reStatus.isGranted) {
          eStatus = false;
          break;
        }
      }
    }
    return eStatus;
    Future.delayed(Duration(seconds: 2),(){
      Get.offAndToNamed(RouteName.home);
    });
  }

  Future<void> goToHome() async {
    await checkPermission().then((bool value) async {
      if (value) {
        Get.offNamed(RouteName.home);
      } else {
        //openAppSettings();
        Get.offNamed(RouteName.home);
      }
    });
  }
}