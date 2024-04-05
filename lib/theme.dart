import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4283720996),
      surfaceTint: Color(4283720996),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292340635),
      onPrimaryContainer: Color(4279639808),
      secondary: Color(4281100870),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4289786307),
      onSecondaryContainer: Color(4278198543),
      tertiary: Color(4287581238),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294958032),
      onTertiaryContainer: Color(4281993984),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294703854),
      onBackground: Color(4279966741),
      surface: Color(4294703854),
      onSurface: Color(4279966741),
      surfaceVariant: Color(4293125331),
      onSurfaceVariant: Color(4282796092),
      outline: Color(4285954155),
      outlineVariant: Color(4291217592),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294111717),
      inversePrimary: Color(4290498434),
      primaryFixed: Color(4292340635),
      onPrimaryFixed: Color(4279639808),
      primaryFixedDim: Color(4290498434),
      onPrimaryFixedVariant: Color(4282207245),
      secondaryFixed: Color(4289786307),
      onSecondaryFixed: Color(4278198543),
      secondaryFixedDim: Color(4287944104),
      onSecondaryFixedVariant: Color(4279128367),
      tertiaryFixed: Color(4294958032),
      onTertiaryFixed: Color(4281993984),
      tertiaryFixedDim: Color(4294948254),
      onTertiaryFixedVariant: Color(4285674785),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294703854),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914338),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281944073),
      surfaceTint: Color(4283720996),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285168440),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278668588),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282614106),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285346077),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289356106),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294703854),
      onBackground: Color(4279966741),
      surface: Color(4294703854),
      onSurface: Color(4279966741),
      surfaceVariant: Color(4293125331),
      onSurfaceVariant: Color(4282532920),
      outline: Color(4284375123),
      outlineVariant: Color(4286217326),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294111717),
      inversePrimary: Color(4290498434),
      primaryFixed: Color(4285168440),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283589154),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282614106),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280903491),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289356106),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287383860),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294703854),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914338),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280034816),
      surfaceTint: Color(4283720996),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281944073),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200596),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278668588),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282585602),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285346077),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294703854),
      onBackground: Color(4279966741),
      surface: Color(4294703854),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293125331),
      onSurfaceVariant: Color(4280493339),
      outline: Color(4282532920),
      outlineVariant: Color(4282532920),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348393),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292933028),
      primaryFixed: Color(4281944073),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280627456),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278668588),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278203675),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285346077),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283505674),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598735),
      surfaceBright: Color(4294703854),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294309096),
      surfaceContainer: Color(4293914338),
      surfaceContainerHigh: Color(4293519837),
      surfaceContainerHighest: Color(4293125079),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4284831119),
      surfaceTint: Color(4284960932),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293582335),
      onPrimaryContainer: Color(4280352861),
      secondary: Color(4284636017),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293451512),
      onSecondaryContainer: Color(4280097067),
      tertiary: Color(4286403168),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957284),
      onTertiaryContainer: Color(4281405725),
      error: Color(4289930782),
      onError: Color(4294967295),
      errorContainer: Color(4294565596),
      onErrorContainer: Color(4282453515),
      background: Color(4294899711),
      onBackground: Color(4280097568),
      surface: Color(4294899711),
      onSurface: Color(4280097568),
      surfaceVariant: Color(4293386476),
      onSurfaceVariant: Color(4282991951),
      outline: Color(4286149758),
      outlineVariant: Color(4291478736),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294307831),
      inversePrimary: Color(4291869951),
      primaryFixed: Color(4293582335),
      onPrimaryFixed: Color(4280352861),
      primaryFixedDim: Color(4291869951),
      onPrimaryFixedVariant: Color(4283381643),
      secondaryFixed: Color(4293451512),
      onSecondaryFixed: Color(4280097067),
      secondaryFixedDim: Color(4291609308),
      onSecondaryFixedVariant: Color(4283057240),
      tertiaryFixed: Color(4294957284),
      onTertiaryFixed: Color(4281405725),
      tertiaryFixedDim: Color(4293900488),
      onTertiaryFixedVariant: Color(4284693320),
      surfaceDim: Color(4292794593),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439674),
      surfaceContainer: Color(4294176247),
      surfaceContainerHigh: Color(4293715696),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282988913),
      surfaceTint: Color(4284831119),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286278567),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282988913),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286344103),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285214533),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289027959),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411116),
      onError: Color(4294967295),
      errorContainer: Color(4289355610),
      onErrorContainer: Color(4294967295),
      background: Color(4294834175),
      onBackground: Color(4280097568),
      surface: Color(4294834175),
      onSurface: Color(4280097568),
      surfaceVariant: Color(4293386475),
      onSurfaceVariant: Color(4282728778),
      outline: Color(4284570983),
      outlineVariant: Color(4286413187),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294307831),
      inversePrimary: Color(4291804670),
      primaryFixed: Color(4286278567),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284633996),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286344103),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284633996),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289027959),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287186782),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294834175),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505210),
      surfaceContainer: Color(4294110452),
      surfaceContainerHigh: Color(4293715694),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4280751950),
      surfaceTint: Color(4284831119),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282988913),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280751950),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282988913),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282519076),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285214533),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650382),
      onError: Color(4294967295),
      errorContainer: Color(4285411116),
      onErrorContainer: Color(4294967295),
      background: Color(4294834175),
      onBackground: Color(4280097568),
      surface: Color(4294834175),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4293386475),
      onSurfaceVariant: Color(4280623915),
      outline: Color(4282728778),
      outlineVariant: Color(4282728778),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4294043903),
      primaryFixed: Color(4282988913),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281475929),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282988913),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281475929),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285214533),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283439407),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294834175),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294505210),
      surfaceContainer: Color(4294110452),
      surfaceContainerHigh: Color(4293715694),
      surfaceContainerHighest: Color(4293320937),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
