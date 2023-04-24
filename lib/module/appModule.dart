import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamentos_obras/routes/routes.dart';

class AppModule extends Module {
  Routes myRoutes = Routes();

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [...myRoutes.routes];
}
