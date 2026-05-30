import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:filmes/main.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/utilitarios/prefs.dart';

void main() {
  testWidgets('Smoke test do app', (WidgetTester tester) async {
    // Configura SharedPreferences e variaveis de ambiente para o teste.
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    dotenv.testLoad(fileInput: 'TMDB_KEY=teste');

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(Prefs(sharedPreferences)),
        ],
        child: const MainApp(),
      ),
    );
  });
}
