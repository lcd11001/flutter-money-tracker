import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/money_tracker.dart';
import 'package:money_tracker/theme.dart';

// final kColorScheme = ColorScheme.fromSeed(
//   seedColor: Colors.lightBlue,
// );

// final kDarkColorScheme = ColorScheme.fromSeed(
//   seedColor: Colors.deepPurple,
// );

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      const MainApp(),
    );
  });
}

// https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-and-light-mode-in-flutter
class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainApp();

  static _MainApp _of(BuildContext context) {
    return context.findAncestorStateOfType<_MainApp>()!;
  }

  static void changeThemeLight(BuildContext context) {
    _of(context).changeThemeMode(ThemeMode.light);
  }

  static void changeThemeDark(BuildContext context) {
    _of(context).changeThemeMode(ThemeMode.dark);
  }
}

class _MainApp extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void changeThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // theme: ThemeData.light(useMaterial3: true).copyWith(
      //   colorScheme: kColorScheme,
      // ),
      // darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
      //   colorScheme: kDarkColorScheme,
      // ),
      theme: ThemeData.light().copyWith(
        colorScheme: MaterialTheme.lightScheme().toColorScheme(),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: MaterialTheme.darkScheme().toColorScheme(),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      themeMode: _themeMode,
      home: const MoneyTrackerApp(),
    );
  }
}
