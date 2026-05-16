import 'package:auto_route/auto_route.dart';

import 'rotas_app.gr.dart';

@AutoRouterConfig()
class RoteadorApp extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(page: TelaInicioRoute.page, initial: true, path: '/'),
    AutoRoute(page: TelaDetalhesFilmeRoute.page, path: '/detalhes'),
  ];
}
