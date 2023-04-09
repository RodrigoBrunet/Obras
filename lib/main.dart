import 'package:flutter/material.dart';
import 'package:orcamentos_obras/controllers/theme_color_controller.dart';
import 'package:orcamentos_obras/pages/home_page.dart';
import 'package:orcamentos_obras/utilitys/color_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
    return ChangeNotifierProvider(
      create: (_) {
        return themeColorController;
      },
      child: Consumer<ThemeColorController>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ColorTheme.themeData(themeColorController.darkTheme, context),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
