//@dart=2.11
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'application.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(Application());
}

