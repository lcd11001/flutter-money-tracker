import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:money_tracker/money_tracker.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.lightBlue,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
);

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.from(
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: kDarkColorScheme,
        useMaterial3: true,
      ),
      home: const MoneyTrackerApp(),
    ),
  );
}
