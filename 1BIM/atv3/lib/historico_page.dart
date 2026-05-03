import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  final List<String> historico;

  const HistoricoPage({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Historico'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: historico.isEmpty
          ? const Center(
              child: Text(
                'Nenhum calculo no historico',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: historico.length,
              itemBuilder: (context, index) {
                final item = historico[historico.length - 1 - index];
                return ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
