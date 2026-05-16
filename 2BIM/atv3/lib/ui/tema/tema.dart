import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const fundoTela = Color(0xFF111111);
const fundoBarraBusca = Color(0xFF1E1E1E);
const botaoPrimario = Color(0xFFD9D9D9);
const bordaPoster = Color(0xFFB5A9A9);
const cinzaBotao = Color(0xFF504F4F);

var roboto = GoogleFonts.roboto();

var largeTitle = roboto.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
var heading1 = roboto.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
var heading2 = roboto.copyWith(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
var body1Regular = roboto.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
var body1Bold = roboto.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
var body2Regular = roboto.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
var body2Bold = roboto.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
var caption = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
var body3Regular = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
var body3Bold = roboto.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
var verySmallText = roboto.copyWith(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

ThemeData criarTema() {
  return ThemeData(
    textTheme: Typography.material2021().englishLike.copyWith(
          headlineLarge: heading1,
          headlineMedium: heading2,
          headlineSmall: body2Regular,
          titleLarge: largeTitle,
          titleMedium: heading2,
          titleSmall: body2Bold,
          bodyLarge: body1Regular,
          bodyMedium: body2Regular,
          bodySmall: body3Regular,
          labelLarge: body1Bold,
          labelMedium: body2Bold,
          labelSmall: caption,
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: fundoBarraBusca,
        labelTextStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: Colors.white);
          }
          return const TextStyle(color: bordaPoster);
        }),
        iconTheme: WidgetStateProperty.all<IconThemeData>(
            const IconThemeData(color: Colors.white)),
        indicatorColor: bordaPoster),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: fundoBarraBusca,
      selectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      unselectedItemColor: bordaPoster,
    ),
  );
}

