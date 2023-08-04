//@dart=2.12
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'application.dart';

Future<void> main() async {
  await GetStorage.init();
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      print('Error: '+errorDetails.exception.toString());
      print(' ---------------- ');
    };
    runApp(Application());
  }, (error, stack) {
    print('Error Catch: $error ${stack.toString()}');
    print(' ---------------- ');
  });

}

