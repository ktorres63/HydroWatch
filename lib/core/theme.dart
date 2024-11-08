import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278740863),
      surfaceTint: Color(4278740863),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290308863),
      onPrimaryContainer: Color(4278198056),
      secondary: Color(4283196011),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291815153),
      onSecondaryContainer: Color(4278656550),
      tertiary: Color(4284111742),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292993279),
      onTertiaryContainer: Color(4279703607),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310653),
      onSurface: Color(4279704607),
      onSurfaceVariant: Color(4282402892),
      outline: Color(4285560956),
      outlineVariant: Color(4290758860),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4287156716),
      primaryFixed: Color(4290308863),
      onPrimaryFixed: Color(4278198056),
      primaryFixedDim: Color(4287156716),
      onPrimaryFixedVariant: Color(4278209889),
      secondaryFixed: Color(4291815153),
      onSecondaryFixed: Color(4278656550),
      secondaryFixedDim: Color(4289972948),
      onSecondaryFixedVariant: Color(4281616978),
      tertiaryFixed: Color(4292993279),
      onTertiaryFixed: Color(4279703607),
      tertiaryFixedDim: Color(4291019755),
      onTertiaryFixedVariant: Color(4282598501),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278208860),
      surfaceTint: Color(4278740863),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281302423),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281419342),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284643457),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282335328),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285624981),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310653),
      onSurface: Color(4279704607),
      onSurfaceVariant: Color(4282139720),
      outline: Color(4283981924),
      outlineVariant: Color(4285824128),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4287156716),
      primaryFixed: Color(4281302423),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278281341),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284643457),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283064168),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285624981),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283980155),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199857),
      surfaceTint: Color(4278740863),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208860),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279182637),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281419342),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280164158),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282335328),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310653),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280100137),
      outline: Color(4282139720),
      outlineVariant: Color(4282139720),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086260),
      inversePrimary: Color(4292014591),
      primaryFixed: Color(4278208860),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202687),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281419342),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279906360),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282335328),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280822345),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271070),
      surfaceBright: Color(4294310653),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981431),
      surfaceContainer: Color(4293586674),
      surfaceContainerHigh: Color(4293192172),
      surfaceContainerHighest: Color(4292797414),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287156716),
      surfaceTint: Color(4287156716),
      onPrimary: Color(4278203716),
      primaryContainer: Color(4278209889),
      onPrimaryContainer: Color(4290308863),
      secondary: Color(4289972948),
      onSecondary: Color(4280169275),
      secondaryContainer: Color(4281616978),
      onSecondaryContainer: Color(4291815153),
      tertiary: Color(4291019755),
      onTertiary: Color(4281085261),
      tertiaryContainer: Color(4282598501),
      onTertiaryContainer: Color(4292993279),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178262),
      onSurface: Color(4292797414),
      onSurfaceVariant: Color(4290758860),
      outline: Color(4287271574),
      outlineVariant: Color(4282402892),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inversePrimary: Color(4278740863),
      primaryFixed: Color(4290308863),
      onPrimaryFixed: Color(4278198056),
      primaryFixedDim: Color(4287156716),
      onPrimaryFixedVariant: Color(4278209889),
      secondaryFixed: Color(4291815153),
      onSecondaryFixed: Color(4278656550),
      secondaryFixedDim: Color(4289972948),
      onSecondaryFixedVariant: Color(4281616978),
      tertiaryFixed: Color(4292993279),
      onTertiaryFixed: Color(4279703607),
      tertiaryFixedDim: Color(4291019755),
      onTertiaryFixedVariant: Color(4282598501),
      surfaceDim: Color(4279178262),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287419889),
      surfaceTint: Color(4287156716),
      onPrimary: Color(4278196513),
      primaryContainer: Color(4283472564),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290236121),
      onSecondary: Color(4278327585),
      secondaryContainer: Color(4286485662),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291282927),
      onTertiary: Color(4279374641),
      tertiaryContainer: Color(4287467187),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178262),
      onSurface: Color(4294441982),
      onSurfaceVariant: Color(4291087568),
      outline: Color(4288455848),
      outlineVariant: Color(4286350472),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inversePrimary: Color(4278210403),
      primaryFixed: Color(4290308863),
      onPrimaryFixed: Color(4278195227),
      primaryFixedDim: Color(4287156716),
      onPrimaryFixedVariant: Color(4278205515),
      secondaryFixed: Color(4291815153),
      onSecondaryFixed: Color(4278195227),
      secondaryFixedDim: Color(4289972948),
      onSecondaryFixedVariant: Color(4280564033),
      tertiaryFixed: Color(4292993279),
      onTertiaryFixed: Color(4278980140),
      tertiaryFixedDim: Color(4291019755),
      onTertiaryFixedVariant: Color(4281480019),
      surfaceDim: Color(4279178262),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294376703),
      surfaceTint: Color(4287156716),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287419889),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294376703),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290236121),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294834687),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291282927),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178262),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294376703),
      outline: Color(4291087568),
      outlineVariant: Color(4291087568),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797414),
      inversePrimary: Color(4278201915),
      primaryFixed: Color(4291096063),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287419889),
      onPrimaryFixedVariant: Color(4278196513),
      secondaryFixed: Color(4292078581),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290236121),
      onSecondaryFixedVariant: Color(4278327585),
      tertiaryFixed: Color(4293321983),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291282927),
      onTertiaryFixedVariant: Color(4279374641),
      surfaceDim: Color(4279178262),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849297),
      surfaceContainerLow: Color(4279704607),
      surfaceContainer: Color(4279967779),
      surfaceContainerHigh: Color(4280625965),
      surfaceContainerHighest: Color(4281349688),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
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


  List<ExtendedColor> get extendedColors => [
  ];
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
