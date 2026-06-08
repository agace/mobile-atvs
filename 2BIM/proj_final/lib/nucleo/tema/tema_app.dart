import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'marca.dart';

class TemaApp {
  TemaApp._();

  static ThemeData get claro => _construir(Brightness.light);
  static ThemeData get escuro => _construir(Brightness.dark);

  static ThemeData _construir(Brightness brilho) {
    final escuro = brilho == Brightness.dark;

    final tinta = escuro ? const Color(0xFFF4F4F1) : Marca.tinta;
    final sobreTinta = escuro ? Marca.tinta : Colors.white;
    final fundo = escuro ? Marca.fundoEscuro : Marca.fundoClaro;
    final superficie = escuro ? Marca.superficieEscura : Marca.superficieClara;
    final contorno = escuro ? Marca.contornoEscuro : Marca.contornoClaro;
    final suave = escuro ? const Color(0xFF9A9AA1) : Marca.tintaSuave;

    final esquema = ColorScheme(
      brightness: brilho,
      primary: tinta,
      onPrimary: sobreTinta,
      secondary: Marca.acento,
      onSecondary: Marca.tinta,
      surface: superficie,
      onSurface: tinta,
      onSurfaceVariant: suave,
      outline: contorno,
      outlineVariant: contorno,
      error: Marca.alerta,
      onError: Colors.white,
      surfaceContainerHighest: escuro
          ? const Color(0xFF202023)
          : const Color(0xFFF0F0EB),
    );

    final base = ThemeData(brightness: brilho, useMaterial3: true);
    final texto = GoogleFonts.plusJakartaSansTextTheme(base.textTheme)
        .apply(bodyColor: tinta, displayColor: tinta)
        .copyWith(
          headlineMedium: GoogleFonts.plusJakartaSans(
            color: tinta,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
          headlineSmall: GoogleFonts.plusJakartaSans(
            color: tinta,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
          ),
          titleLarge: GoogleFonts.plusJakartaSans(
            color: tinta,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      textTheme: texto,
      scaffoldBackgroundColor: fundo,
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: fundo,
        surfaceTintColor: Colors.transparent,
        foregroundColor: tinta,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: texto.titleLarge?.copyWith(fontSize: 22),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: superficie,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Marca.raio),
          side: BorderSide(color: contorno),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: superficie,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 66,
        indicatorColor: tinta,
        labelTextStyle: WidgetStatePropertyAll(
          texto.labelMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        iconTheme: WidgetStateProperty.resolveWith((estados) {
          final ativo = estados.contains(WidgetState.selected);
          return IconThemeData(color: ativo ? sobreTinta : suave, size: 24);
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: superficie,
        selectedColor: tinta,
        side: BorderSide(color: contorno),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        labelStyle: texto.labelLarge,
        secondaryLabelStyle: texto.labelLarge?.copyWith(color: sobreTinta),
        showCheckmark: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: superficie,
        hintStyle: TextStyle(color: suave),
        prefixIconColor: suave,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Marca.raio),
          borderSide: BorderSide(color: contorno),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Marca.raio),
          borderSide: BorderSide(color: contorno),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Marca.raio),
          borderSide: BorderSide(color: tinta, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: tinta,
          foregroundColor: sobreTinta,
          disabledBackgroundColor: contorno,
          disabledForegroundColor: suave,
          textStyle: texto.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Marca.raio),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: tinta,
          textStyle: texto.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Marca.tinta,
        contentTextStyle: texto.bodyMedium?.copyWith(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Marca.raio),
        ),
      ),
      dividerTheme: DividerThemeData(color: contorno, thickness: 1),
    );
  }
}
