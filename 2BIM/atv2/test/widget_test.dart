import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:atv2_navigator_router/main.dart';

void main() {
  testWidgets('Renderiza tela inicial de filmes', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    const channel = MethodChannel('flutter/assets');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(channel.name, (message) async => null);

    await tester.pumpWidget(MainApp());
    await tester.pump();

    expect(find.text('Catalogo de Filmes'), findsOneWidget);
  });
}
