import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dominio/entidades/notificacao.dart';
import '../../nucleo/formatador.dart';
import '../../nucleo/i18n/textos.dart';
import '../../nucleo/tema/marca.dart';
import '../provedores/provedores.dart';
import 'aviso_vazio.dart';

Future<void> abrirPainelNotificacoes(BuildContext context, WidgetRef ref) {
  ref.read(notificacoesProvider.notifier).marcarTodasComoLidas();
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => const _PainelNotificacoes(),
  );
}

class _PainelNotificacoes extends ConsumerWidget {
  const _PainelNotificacoes();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    final notificacoes = ref.watch(notificacoesProvider);

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 12, 8),
              child: Row(
                children: [
                  Text(
                    t.notificacoesTitulo,
                    style: tema.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  if (notificacoes.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        ref.read(notificacoesProvider.notifier).limpar();
                        Navigator.of(context).pop();
                      },
                      child: Text(t.limpar),
                    ),
                ],
              ),
            ),
            if (notificacoes.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                child: AvisoVazio(
                  icone: Icons.notifications_none_rounded,
                  titulo: t.notifVazioTitulo,
                  descricao: t.notifVazioDescricao,
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: notificacoes.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (_, i) =>
                      _CartaoNotificacao(notificacao: notificacoes[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CartaoNotificacao extends StatelessWidget {
  const _CartaoNotificacao({required this.notificacao});

  final Notificacao notificacao;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tema.colorScheme.surface,
        borderRadius: BorderRadius.circular(Marca.raio),
        border: Border.all(color: tema.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Marca.acento,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_rounded, color: Marca.tinta),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificacao.titulo,
                  style: tema.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notificacao.mensagem,
                  style: tema.textTheme.bodyMedium?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  Formatador.dataHora(notificacao.criadaEm),
                  style: tema.textTheme.labelSmall?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
