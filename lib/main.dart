import 'package:flutter/material.dart';
import 'package:zaracast/src/app.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/core/platform/device_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DeviceInfo.setDeviceInfo();

  await registerSingletons();

  runApp(const MyApp());
}
