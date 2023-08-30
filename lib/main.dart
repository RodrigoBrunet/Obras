import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamentos_obras/controllers/theme_color_controller.dart';
import 'package:orcamentos_obras/modules/appModule.dart';
import 'package:orcamentos_obras/config/routes/routes.dart';
import 'package:orcamentos_obras/config/theme/color_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

ThemeColorController themeColorController = ThemeColorController();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getBoolValueTheme();
  }

  void getBoolValueTheme() async {
    themeColorController.darkTheme =
        await themeColorController.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(NamedRoutes.HOMEPAGE);
    return ChangeNotifierProvider(
      create: (_) {
        return themeColorController;
      },
      child: Consumer<ThemeColorController>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme:
                ColorTheme.themeData(themeColorController.darkTheme, context),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        },
      ),
    );
  }
}
