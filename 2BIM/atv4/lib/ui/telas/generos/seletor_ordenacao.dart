import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/utilitarios/utilitarios.dart';

typedef OnSortSelected = void Function(Sorting);

class SeletorOrdenacao extends ConsumerStatefulWidget {
  final bool useSliver;
  final OnSortSelected onSortSelected;
  final Sorting ordenacaoInicial;

  const SeletorOrdenacao(
      {required this.useSliver,
      required this.onSortSelected,
      this.ordenacaoInicial = Sorting.aToz,
      super.key});

  @override
  ConsumerState<SeletorOrdenacao> createState() => _SortPickerState();
}

class _SortPickerState extends ConsumerState<SeletorOrdenacao> {
  late Sorting selectedSort = widget.ordenacaoInicial;

  @override
  Widget build(BuildContext context) {
    if (widget.useSliver) {
      return SliverToBoxAdapter(
          child: buildRow()
      );
    } else {
      return buildRow();
    }
  }

  Widget buildRow() {
    return Row(
      children: [
        const Spacer(),
        Text(
          selectedSort.name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        addHorizontalSpace(16),
        PopupMenuButton<Sorting>(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).iconTheme.color,
          ),
          onSelected: (Sorting value) {
            widget.onSortSelected(value);
          },
          itemBuilder: (BuildContext context) {
            return Sorting.values
                .mapIndexed<PopupMenuItem<Sorting>>((int index, Sorting sort) {
              return CheckedPopupMenuItem<Sorting>(
                checked: selectedSort == sort,
                value: sort,
                onTap: () {
                  setState(() {
                    selectedSort = sort;
                  });
                },
                child: Text(sort.name),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}