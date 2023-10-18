import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'fonts_manager.dart';
import 'styles_manager.dart';
import 'colors_manager.dart';
import 'values_manager.dart';

abstract class AppTheme {
  static ThemeData getApplicationLightTheme() => ThemeData(
        useMaterial3: true,

        // Swatch color
        colorSchemeSeed: ColorsManager.swatchRed,

        // Scaffold
        scaffoldBackgroundColor: ColorsManager.scaffoldColor,

        // AppBar
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: ColorsManager.swatchRed,
          iconTheme: const IconThemeData(color: ColorsManager.mainColor),
          titleTextStyle: getSemiBoldStyle(
              fontName: FontsName.headlinesFont, fontSize: FontsSize.s18),
        ),

        // Text Themes
        textTheme: TextTheme(
          // Details text
          bodyLarge: getRegularStyle(
              fontName: FontsName.detailsFont, fontSize: FontsSize.s16),
          bodyMedium: getMediumStyle(
              fontName: FontsName.detailsFont, fontSize: FontsSize.s14),
          bodySmall: getLightStyle(
              fontName: FontsName.detailsFont, fontSize: FontsSize.s12),

          // Headlines text
          headlineSmall: getRegularStyle(
              fontName: FontsName.headlinesFont, fontSize: FontsSize.s16),
          headlineMedium: getSemiBoldStyle(
              fontName: FontsName.headlinesFont, fontSize: FontsSize.s14),
          headlineLarge: getBoldStyle(
              fontName: FontsName.headlinesFont, fontSize: FontsSize.s25),
        ),

        // Text Form Field theme
        inputDecorationTheme: InputDecorationTheme(
          // focusColor: ColorsManager.tffEnabled,
          // fillColor: ColorsManager.tffBackground,
          // filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DoubleManager.d_8)),
          contentPadding: const EdgeInsets.all(DoubleManager.d_8),
          hintStyle: getSemiBoldStyle(
            fontName: FontsName.detailsFont,
            fontSize: FontsSize.s14,
          ),
          labelStyle: getRegularStyle(
            fontName: FontsName.detailsFont,
            color: ColorsManager.swatchRed,
            fontSize: FontsSize.s14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_8),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_8),
            borderSide: const BorderSide(color: ColorsManager.swatchRed),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_8),
          ),
          prefixIconColor: ColorsManager.mainColor,
          suffixIconColor: ColorsManager.mainColor,
          errorStyle: getMediumStyle(
            fontName: FontsName.detailsFont,
            color: ColorsManager.mainColor,
            fontSize: FontsSize.s14,
          ),
        ),

        // Icons
        iconTheme: const IconThemeData(
          size: DoubleManager.d_18,
          color: ColorsManager.mainColor,
        ),

        // Checkbox
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DoubleManager.d_5)),
          side: BorderSide(
            style: BorderStyle.solid,
            color: ColorsManager.mainColor,
            width: DoubleManager.d_05.w,
          ),
        ),

        // Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            minimumSize: Size(double.infinity, DoubleManager.d_7.h),
            textStyle: getSemiBoldStyle(
              fontName: FontsName.headlinesFont,
              fontSize: FontsSize.s16,
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: getBoldStyle(
            fontName: FontsName.headlinesFont,
            fontSize: FontsSize.s12,
          )),
        ),

        // Dialogs
        dialogBackgroundColor: ColorsManager.mainColor,
        dialogTheme: DialogTheme(
          titleTextStyle: getRegularStyle(
            fontName: FontsName.detailsFont,
            fontSize: FontsSize.s12,
          ),
        ),
      );
}
