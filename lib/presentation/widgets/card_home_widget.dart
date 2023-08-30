// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamentos_obras/controllers/card_home_controller.dart';
import 'package:orcamentos_obras/main.dart';
import 'package:orcamentos_obras/config/routes/routes.dart';
import 'package:orcamentos_obras/config/theme/color_theme.dart';
import 'package:orcamentos_obras/presentation/widgets/switch_theme_app_widget.dart';

class CardHomeWidget extends StatefulWidget {
  const CardHomeWidget({super.key});

  @override
  State<CardHomeWidget> createState() => _CardHomeStateWidget();
}

class _CardHomeStateWidget extends State<CardHomeWidget> {
  CardHomeController homeController = CardHomeController();
  @override
  Widget build(BuildContext context) {
    var cardHeight = MediaQuery.of(context).size.height;
    var cardWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SwitchThemeAppWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: homeController,
              builder: (context, child) => GestureDetector(
                onTap: () {
                  homeController.buttonPressed();
                  Modular.to.navigate(NamedRoutes.CRIAR_ORCAMENTO_PAGE);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: cardHeight * 0.30,
                  width: cardWidth * 0.45,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: homeController.isButtonPressed
                            ? Colors.grey.shade100
                            : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: homeController.isButtonPressed
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(6, 6),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-6, -6),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                    color: ColorTheme.themeData(
                            themeColorController.darkTheme, context)
                        .cardColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/house.png',
                        color: ColorTheme.themeData(
                                themeColorController.darkTheme, context)
                            .primaryColor,
                        height: 180,
                      ),
                      Text(
                        'Residencial',
                        style: TextStyle(
                          color: ColorTheme.themeData(
                                  themeColorController.darkTheme, context)
                              .primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: cardHeight * 0.30,
              width: cardWidth * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorTheme.themeData(
                        themeColorController.darkTheme, context)
                    .cardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/edificacao.png',
                    color: ColorTheme.themeData(
                            themeColorController.darkTheme, context)
                        .primaryColor,
                    height: 180,
                  ),
                  Text(
                    'Edificações',
                    style: TextStyle(
                      color: ColorTheme.themeData(
                              themeColorController.darkTheme, context)
                          .primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
