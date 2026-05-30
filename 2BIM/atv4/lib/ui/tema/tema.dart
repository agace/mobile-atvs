import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Paleta do tema escuro (padrao do app).
const fundoTela = Color(0xFF111111);
const fundoBarraBusca = Color(0xFF1E1E1E);
const botaoPrimario = Color(0xFFD9D9D9);
const bordaPoster = Color(0xFFB5A9A9);
const cinzaBotao = Color(0xFF504F4F);

// Paleta do tema claro.
const fundoTelaClaro = Color(0xFFF5F5F5);
const fundoBarraBuscaClaro = Color(0xFFE3E3E3);
const textoClaro = Color(0xFF111111);

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

// Monta o conjunto de estilos de texto aplicando a cor adequada ao tema.
TextTheme _criarTextTheme(Color cor) {
  return Typography.material2021().englishLike.copyWith(
        headlineLarge: heading1.copyWith(color: cor),
        headlineMedium: heading2.copyWith(color: cor),
        headlineSmall: body2Regular.copyWith(color: cor),
        titleLarge: largeTitle.copyWith(color: cor),
        titleMedium: heading2.copyWith(color: cor),
        titleSmall: body2Bold.copyWith(color: cor),
        bodyLarge: body1Regular.copyWith(color: cor),
        bodyMedium: body2Regular.copyWith(color: cor),
        bodySmall: body3Regular.copyWith(color: cor),
        labelLarge: body1Bold.copyWith(color: cor),
        labelMedium: body2Bold.copyWith(color: cor),
        labelSmall: caption.copyWith(color: cor),
      );
}

// Cria o tema (claro ou escuro) de acordo com o brilho informado.
// O app oferece os dois e a escolha do usuario e persistida em SharedPreferences.
ThemeData criarTema(Brightness brightness) {
  final escuro = brightness == Brightness.dark;
  final corTexto = escuro ? Colors.white : textoClaro;
  final fundo = escuro ? fundoTela : fundoTelaClaro;
  final fundoBarra = escuro ? fundoBarraBusca : fundoBarraBuscaClaro;

  return ThemeData(
    brightness: brightness,
    useMaterial3: true,
    scaffoldBackgroundColor: fundo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFB5A9A9),
      brightness: brightness,
    ),
    textTheme: _criarTextTheme(corTexto),
    appBarTheme: AppBarTheme(
      backgroundColor: fundo,
      foregroundColor: corTexto,
    ),
    iconTheme: IconThemeData(color: corTexto),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: fundoBarra,
        labelTextStyle:
            WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: corTexto);
          }
          return const TextStyle(color: bordaPoster);
        }),
        iconTheme: WidgetStateProperty.all<IconThemeData>(
            IconThemeData(color: corTexto)),
        indicatorColor: bordaPoster),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: fundoBarra,
      selectedItemColor: corTexto,
      unselectedLabelStyle: const TextStyle(color: bordaPoster),
      showUnselectedLabels: true,
      unselectedItemColor: bordaPoster,
    ),
  );
}
