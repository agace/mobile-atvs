import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tarefas_page.dart';

void main() {
  runApp(const ProviderScope(child: TodoListApp()));
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF121212),
          primary: Color(0xFFE0E0E0),
        ),
        useMaterial3: true,
      ),
      home: const TarefasPage(),
    );
  }
}
