import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants/env.dart';
import 'screens/settings/settings_controller.dart';
import 'services/generate_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  GenerateRoute get generateRoute =>
      GenerateRoute(settingsController: settingsController);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: dotenv.env[Env.debug] == 'true',
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
          onGenerateRoute: generateRoute.load(),
        );
      },
    );
  }
}
