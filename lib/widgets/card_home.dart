import 'package:flutter/material.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key});

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
      ],
    );
  }
}
