import 'package:app_01/src/app.dart';
import 'package:app_01/src/ui/pages/settings/settings_controller.dart';
import 'package:app_01/src/ui/pages/settings/settings_service.dart';
import 'package:flutter/material.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}
