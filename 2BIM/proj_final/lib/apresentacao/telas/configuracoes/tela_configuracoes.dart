import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../nucleo/i18n/textos.dart';
import '../../../nucleo/tema/marca.dart';
import '../../provedores/provedores.dart';
import '../../widgets/logo_marca.dart';

class TelaConfiguracoes extends ConsumerWidget {
  const TelaConfiguracoes({super.key});

  static const _idiomas = {'pt': 'Português', 'en': 'English'};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    final temaEscuro = ref.watch(controladorTemaProvider);
    final idioma = ref.watch(controladorIdiomaProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.abaAjustes)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Marca.tinta,
              borderRadius: BorderRadius.circular(Marca.raioGrande),
            ),
            child: Row(
              children: [
                const LogoMarca(mostrarNome: false, tamanho: 46),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoMarca(tamanho: 26, cor: Colors.white),
                      const SizedBox(height: 4),
                      Text(
                        Marca.assinatura,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            t.preferencias,
            style: tema.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          _Grupo(
            children: [
              SwitchListTile(
                secondary: Icon(
                  temaEscuro
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                ),
                title: Text(t.temaEscuro),
                subtitle: Text(t.temaEscuroSubtitulo),
                value: temaEscuro,
                onChanged: (_) =>
                    ref.read(controladorTemaProvider.notifier).alternar(),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.language_rounded),
                title: Text(t.idiomaLabel),
                subtitle: Text(_idiomas[idioma] ?? idioma),
                trailing: DropdownButton<String>(
                  value: idioma,
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(Marca.raio),
                  items: [
                    for (final entrada in _idiomas.entries)
                      DropdownMenuItem(
                        value: entrada.key,
                        child: Text(entrada.value),
                      ),
                  ],
                  onChanged: (valor) {
                    if (valor != null) {
                      ref
                          .read(controladorIdiomaProvider.notifier)
                          .definir(valor);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            t.sobre,
            style: tema.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          _Grupo(
            children: [
              ListTile(
                leading: const Icon(Icons.verified_outlined),
                title: Text(t.versao),
                trailing: const Text('1.0.0'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: Text(t.projetoFinal),
                subtitle: Text(t.projetoFinalSubtitulo),
                onTap: () => showAboutDialog(
                  context: context,
                  applicationName: Marca.nome,
                  applicationVersion: '1.0.0',
                  applicationIcon: const LogoMarca(mostrarNome: false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Grupo extends StatelessWidget {
  const _Grupo({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Marca.raio),
      ),
      child: Column(children: children),
    );
  }
}
