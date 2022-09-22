import 'package:flutter/material.dart';
import '../../models/widgets/routes.dart';
import '../../screens/settings/settings_controller.dart';
import '../../widgets/base_navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  static const Routes route = Routes(
    title: 'Settings',
    name: 'settings',
    url: '/settings',
  );

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return BaseNavbar(
      title: route.title,
      name: route.name,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: controller.themeMode,
          onChanged: controller.updateThemeMode,
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
