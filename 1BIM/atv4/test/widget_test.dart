import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/main.dart';

void main() {
  testWidgets('App renderiza corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: TodoListApp()));
    expect(find.text('Lista de Tarefas'), findsOneWidget);
    expect(find.text('Nenhuma tarefa cadastrada.'), findsOneWidget);
  });
}
