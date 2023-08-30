// ignore_for_file: constant_identifier_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamentos_obras/presentation/views/orcamento_page.dart';
import 'package:orcamentos_obras/presentation/views/home_page.dart';

class Routes {
  final List<ChildRoute> routes = [
    ChildRoute(
      NamedRoutes.HOMEPAGE,
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ChildRoute(
      NamedRoutes.CRIAR_ORCAMENTO_PAGE,
      child: (_, __) => const CriarOrcamentoPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}

class NamedRoutes {
  static const HOMEPAGE = "/home_page";
  static const CRIAR_ORCAMENTO_PAGE = "/criar_orcamento_page";
}
