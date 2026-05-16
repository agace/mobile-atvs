import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/ui/tema/tema.dart';

@RoutePage(name: 'TelaPrincipalRoute')
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: fundoTela,
      routes: const [
        TelaInicioRoute(),
        TelaGenerosRoute(),
        TelaFavoritosRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => buildBottomBar(tabsRouter),
    );
  }

  Widget buildBottomBar(TabsRouter tabsRouter) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
        NavigationDestination(icon: Icon(Symbols.genres), label: 'Generos'),
        NavigationDestination(icon: Icon(Icons.favorite), label: 'Favoritos'),
      ],
      selectedIndex: tabsRouter.activeIndex,
      onDestinationSelected: (navIndex) {
        setState(() {
          tabsRouter.setActiveIndex(navIndex);
        });
      },
    );
  }
}
