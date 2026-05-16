import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/main.dart';

void main() {
  testWidgets('Smoke test do app', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainApp()));
  });
}
