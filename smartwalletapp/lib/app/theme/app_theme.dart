import 'package:flutter/material.dart';
import 'text_styles.dart';
import 'colors.dart';
class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTextStyles.textThemeLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTextStyles.appBarTitleLight,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.background, // Màu chính
      secondary: AppColors.white, // Màu phụ
      onPrimary: AppColors.backgroundDark // màu chữ
    ),
  );
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: AppTextStyles.textThemeDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      titleTextStyle: AppTextStyles.appBarTitleDark,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondaryColor, // Màu chính
      secondary: AppColors.bgColor,// Màu phụ
      onPrimary: AppColors.background,// màu chữ
      // Màu chữ trên nền lỗi
    ),  );
}
