import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';

enum DeviceType { android, ios }

class DeviceInfo {
  static late String deviceId;
  static late DeviceType deviceType;
  static late String appDirectoryPath;
  static late String tempDirectoryPath;

  static Future<void> setDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceType = DeviceType.android;
      deviceId = androidDeviceInfo.serialNumber.isNotEmpty
          ? androidDeviceInfo.serialNumber
          : 'android';
    } else if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceType = DeviceType.ios;
      deviceId = iosDeviceInfo.identifierForVendor ?? 'ios';
    }

    final futures = <Future<Directory>>[
      getApplicationSupportDirectory(),
      getTemporaryDirectory(),
    ];

    final directories = await Future.wait(futures);
    appDirectoryPath = directories[0].path;
    tempDirectoryPath = directories[1].path;
  }
}
