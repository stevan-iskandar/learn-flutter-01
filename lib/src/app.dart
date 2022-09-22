import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn_flutter_01/src/constants/now_ui_colors.dart';
import 'screens/settings/settings_controller.dart';
import 'services/generate_route_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  GenerateRouteService get generateRouteService =>
      GenerateRouteService(settingsController: settingsController);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Montserrat',
            primarySwatch: Colors.orange,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            primarySwatch: Colors.orange,
          ),
          themeMode: settingsController.themeMode,
          onGenerateRoute: generateRouteService.load(),
        );
      },
    );
  }
}
