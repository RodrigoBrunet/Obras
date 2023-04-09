import 'package:flutter/material.dart';
import 'package:orcamentos_obras/const/icons/icons_package_change_theme.dart';
import 'package:orcamentos_obras/controllers/theme_color_controller.dart';
import 'package:provider/provider.dart';

class SwitchThemeAppWidget extends StatefulWidget {
  const SwitchThemeAppWidget({super.key});

  @override
  State<SwitchThemeAppWidget> createState() => _SwitchThemeStateAppWidget();
}

class _SwitchThemeStateAppWidget extends State<SwitchThemeAppWidget> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeColorController>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconsTheme.wb_sunny,
              color: Colors.yellow,
              size: 30.0,
            ),
          ),
          Switch(
            value: themeChange.darkTheme,
            onChanged: (value) {
              themeChange.darkTheme = value;
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconsTheme.moon,
              color: Colors.yellow.shade800,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
