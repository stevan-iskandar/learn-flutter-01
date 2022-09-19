import 'package:app_01/src/ui/pages/sample_feature/sample_item_details_view.dart';
import 'package:app_01/src/ui/pages/sample_feature/sample_item_list_view.dart';
import 'package:app_01/src/ui/pages/settings/settings_controller.dart';
import 'package:app_01/src/ui/pages/settings/settings_view.dart';
import 'package:flutter/material.dart';

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
            case SettingsView.routeName:
              return SettingsView(controller: settingsController);
            case SampleItemDetailsView.routeName:
              return const SampleItemDetailsView();
            case SampleItemListView.routeName:
              return const SampleItemListView();
            default:
              return const SampleItemListView();
          }
        },
      );
    };
  }
}
