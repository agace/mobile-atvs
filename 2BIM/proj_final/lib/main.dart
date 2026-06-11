import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apresentacao/provedores/provedores.dart';
import 'apresentacao/rotas/rotas.dart';
import 'nucleo/i18n/textos.dart';
import 'nucleo/prefs.dart';
import 'nucleo/tema/tema_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Prefs(await SharedPreferences.getInstance());

  runApp(
    ProviderScope(
      overrides: [prefsProvider.overrideWithValue(prefs)],
      child: const AppLoja(),
    ),
  );
}

class AppLoja extends ConsumerWidget {
  const AppLoja({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temaEscuro = ref.watch(controladorTemaProvider);
    final idioma = ref.watch(controladorIdiomaProvider);
    final textos = Textos.para(idioma);

    return MaterialApp.router(
      title: 'ecremm',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.claro,
      darkTheme: TemaApp.escuro,
      themeMode: temaEscuro ? ThemeMode.dark : ThemeMode.light,
      locale: textos.locale,
      supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      builder: (context, child) => TextosEscopo(textos: textos, child: child!),
      routerConfig: roteador,
    );
  }
}
