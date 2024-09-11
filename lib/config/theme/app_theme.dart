import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme() {
    // Definir los colores
    const Color primaryColor = Color(0xFF1E88E5); // Azul claro
    const Color primaryDarkColor = Color(0xFF0D47A1); // Azul oscuro
    const Color backgroundColor = Color(0xFFFFFFFF); // Blanco
    const Color textColor = Color(0xFF000000); // Negro para el texto

    return ThemeData(
        // Colores principales
        primaryColor: primaryColor,
        primaryColorDark: primaryDarkColor,
        scaffoldBackgroundColor: backgroundColor,

        // Colores de los textos
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: textColor,
              fontSize: 96.0,
              fontWeight: FontWeight.w100,
              letterSpacing: -1.5),
          displayMedium: TextStyle(
              color: textColor,
              fontSize: 60.0,
              fontWeight: FontWeight.w300,
              letterSpacing: -0.5),
          displaySmall: TextStyle(
              color: textColor,
              fontSize: 48.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.0),
          headlineMedium: TextStyle(
              color: textColor,
              fontSize: 34.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.25),
          headlineSmall: TextStyle(
              color: textColor,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.0),
          titleLarge: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15),
          titleMedium: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.15),
          titleSmall: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.10),
          bodyLarge: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.5),
          bodyMedium: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.25),
          bodySmall: TextStyle(
              color: textColor,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.4),
          labelLarge: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25),
          labelSmall: TextStyle(
              color: textColor,
              fontSize: 10.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.5),
        ),

        // Definir los colores del botón
        buttonTheme: const ButtonThemeData(
          buttonColor: primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),

        // Definir el estilo de los campos de texto
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryDarkColor),
            borderRadius: BorderRadius.circular(8),
          ),
          labelStyle: const TextStyle(color: primaryDarkColor),
          hintStyle: const TextStyle(color: primaryDarkColor),
        ),

        // TextButtons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        )

        // Otros estilos de tema que puedas necesitar
        // ...
        );
  }
}
