import 'package:flutter/material.dart'
    show Brightness, Color, ColorScheme, Colors;

import 'app_colors.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.black,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.greyText,
  onPrimaryContainer: AppColors.lightGrey,
  secondary: AppColors.tgBlue,
  onSecondary: AppColors.green,
  secondaryContainer: Colors.yellow,
  error: AppColors.red,
  onSecondaryContainer: AppColors.cardLine,
  ///
  tertiary: Color(0xffA7A7A7),
  onTertiary: Color(0xffA7A7A7),
  inversePrimary: Color(0xffDFDFDF),
  surface: Color(0xffA7A7A7),
  tertiaryContainer: Color(0xffA7A7A7),
  onTertiaryContainer: Color(0xffA7A7A7),
  onSurface: Color(0xffA7A7A7),
  surfaceTint: Color(0xffA7A7A7),
  surfaceVariant: Color(0xffEBFF00),
  onBackground: Color(0xffA7A7A7),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  background: Color(0xffF6F6F6),
  onSurfaceVariant: Color(0xff121211),
  outline: Color(0xff837676),
  outlineVariant: Color(0xffccc6c6),
  shadow: Color(0xffA7A7A7),
  scrim: Color(0xffA7A7A7),
  inverseSurface: Color(0xffA7A7A7),
  onInverseSurface: Color(0xffA7A7A7),
);

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.black,
  onPrimary: AppColors.white,
  primaryContainer: AppColors.greyText,
  onPrimaryContainer: AppColors.lightGrey,
  secondary: AppColors.tgBlue,
  onSecondary: AppColors.green,
  secondaryContainer: Colors.yellow,
  error: AppColors.red,
  ///
  onSecondaryContainer: Colors.black,
  tertiary: Color(0xffA7A7A7),
  onTertiary: Color(0xffA7A7A7),
  inversePrimary: Color(0xffDFDFDF),
  surface: Color(0xffA7A7A7),
  tertiaryContainer: Color(0xffA7A7A7),
  onTertiaryContainer: Color(0xffA7A7A7),
  onSurface: Color(0xffA7A7A7),
  surfaceTint: Color(0xffA7A7A7),
  surfaceVariant: Color(0xffEBFF00),
  onBackground: Color(0xffA7A7A7),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  background: Color(0xffF6F6F6),
  onSurfaceVariant: Color(0xff121211),
  outline: Color(0xff837676),
  outlineVariant: Color(0xffccc6c6),
  shadow: Color(0xffA7A7A7),
  scrim: Color(0xffA7A7A7),
  inverseSurface: Color(0xffA7A7A7),
  onInverseSurface: Color(0xffA7A7A7),
);
