import 'package:flutter/material.dart';
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
  runApp(
    MaterialApp(
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
      themeMode: ThemeMode.light,
      home: const MoneyTrackerApp(),
    ),
  );
}
