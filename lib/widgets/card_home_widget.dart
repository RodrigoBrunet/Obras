import 'package:flutter/material.dart';
import 'package:orcamentos_obras/widgets/switch_theme_app_widget.dart';

class CardHomeWidget extends StatefulWidget {
  const CardHomeWidget({super.key});

  @override
  State<CardHomeWidget> createState() => _CardHomeStateWidget();
}

class _CardHomeStateWidget extends State<CardHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SwitchThemeAppWidget(),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 200,
              color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.business_sharp),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 200,
              color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.electric_bolt),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.wash_outlined),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 200,
              color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.business_sharp),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 200,
              color: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 150,
              width: 200,
              color: Colors.yellow,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.business_sharp),
              ),
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
