import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get theme {
    var typography = Typography.material2021(platform: defaultTargetPlatform);
    var textTheme = typography.black.apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );

    var titleLarge = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      color: Colors.black,
      height: 34 / 24,
      letterSpacing: 0,
    ); //done

    var titleMedium = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      height: 20 / 14,
      color: Colors.black,
      letterSpacing: 0,
    ); //done

    var titleSmall = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      height: 17 / 14,
      color: Colors.black,
      letterSpacing: 0,
    ); //done

    var labelLarge = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      height: 1,
      color: Colors.black,
      letterSpacing: 0,
    ); //done

    var labelSmall = const TextStyle(
      fontSize: 11,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 18 / 14,
      color: Colors.black,
      letterSpacing: 0,
    ); //done

    var bodyLarge = const TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.w700,
      fontFamily: 'Poppins',
      letterSpacing: 0,
      height: 30 / 28,
      color: Colors.black,
    ); //done

    var bodyMedium = const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      height: 20 / 48,
      color: Colors.black,
      letterSpacing: 0,
    );

    var bodySmall = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      height: 20 / 14,
      letterSpacing: 0,
      color: Colors.black.withOpacity(0.85),
    );

    var headlineMedium = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: Colors.black,
      fontStyle: FontStyle.italic,
      letterSpacing: 0,
    ); //done

    var headlineSmall = const TextStyle(
      fontSize: 29,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 38 / 30,
      color: Colors.black,
      letterSpacing: 0,
      fontStyle: FontStyle.normal,
    ); //done

    textTheme = textTheme.copyWith(
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelSmall: labelSmall,
    );

    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: MyColors.border, width: 1),
    );

    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: primaryColor.withOpacity(0.3),
        selectionHandleColor: primaryColor,
      ),
      primaryColor: primaryColor,
      indicatorColor: primaryColor,
      canvasColor: Colors.white,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      typography: typography,

      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(16),
        buttonColor: primaryColor,
      ),

      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: labelLarge,
          fixedSize: const Size(140, 50),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        hintStyle: titleMedium.copyWith(color: Colors.black.withOpacity(0.5)),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),

      iconTheme: const IconThemeData(color: Colors.black, size: 24),

      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 1,
        // color: MyColors.divider,
      ),

      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        onSecondary: Colors.white,
        brightness: Brightness.light,
        background: Colors.white,
      ).copyWith(background: MyColors.background),
    );
  }

  static Color primaryColor = MyColors.primaryColor;
}
