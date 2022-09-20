import 'package:flutter/material.dart';
import '../screens/settings/settings_screen.dart';

class IconButtonToSettings extends StatelessWidget {
  const IconButtonToSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.restorablePushNamed(context, SettingsScreen.routeName);
      },
    );
  }
}
