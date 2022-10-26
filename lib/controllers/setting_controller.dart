import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingController extends GetxController {
  Rx<PackageInfo> packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  ).obs;

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo.value = info;

    print(info.appName);
  }

  @override
  void onInit() {
    _initPackageInfo();
    super.onInit();
  }
}
