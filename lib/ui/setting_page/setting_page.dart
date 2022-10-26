import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController c = Get.put(SettingController());
    return Scaffold(
      body: Obx(
        () {
          return Column(
            children: [
              _infoTile('App name', c.packageInfo.value.appName),
              _infoTile('Package name', c.packageInfo.value.packageName),
              _infoTile('App version', c.packageInfo.value.version),
              _infoTile('Build number', c.packageInfo.value.buildNumber),
              _infoTile('Build signature', c.packageInfo.value.buildSignature),
              _infoTile(
                'Installer store',
                c.packageInfo.value.installerStore ?? 'not available',
              ),
              const Center(
                child: Text('ini Setting page'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }
}
