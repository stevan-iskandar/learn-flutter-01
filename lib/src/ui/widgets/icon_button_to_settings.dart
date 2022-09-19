import 'package:flutter/material.dart';
import 'package:app_01/src/ui/pages/settings/settings_view.dart';

class IconButtonToSettings extends StatelessWidget {
  const IconButtonToSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.restorablePushNamed(context, SettingsView.routeName);
      },
    );
  }
}
