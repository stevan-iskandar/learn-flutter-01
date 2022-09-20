import 'package:flutter/material.dart';
import '../screens/sample/sample_item_details_screen.dart';
import '../screens/sample/sample_item_screen.dart';
import '../screens/settings/settings_controller.dart';
import '../screens/settings/settings_screen.dart';

class GenerateRouteService {
  const GenerateRouteService({
    required this.settingsController,
  });

  final SettingsController settingsController;

  load() {
    return (RouteSettings routeSettings) {
      return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case SettingsScreen.routeName:
              return SettingsScreen(controller: settingsController);
            case SampleItemDetailsScreen.routeName:
              return const SampleItemDetailsScreen();
            case SampleItemScreen.routeName:
              return const SampleItemScreen();
            default:
              return const SampleItemScreen();
          }
        },
      );
    };
  }
}
