import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/sample/sample_item_details_screen.dart';
import '../screens/sample/sample_item_screen.dart';
import '../screens/settings/settings_controller.dart';
import '../screens/settings/settings_screen.dart';

class GenerateRoute {
  const GenerateRoute({
    required this.settingsController,
  });

  final SettingsController settingsController;

  load() {
    return (RouteSettings routeSettings) {
      return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) {
          bool ifCase(String url) => routeSettings.name == url;

          if (ifCase(SettingsScreen.route.url)) {
            return SettingsScreen(controller: settingsController);
          }
          if (ifCase(SampleItemDetailsScreen.route.url)) {
            return const SampleItemDetailsScreen();
          }
          if (ifCase(SampleItemScreen.route.url)) {
            return const SampleItemScreen();
          }
          return const LoginScreen();
        },
      );
    };
  }
}
