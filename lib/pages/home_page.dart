import 'package:flutter/material.dart';
import 'package:orcamentos_obras/widgets/card_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o tipo de orçamento'),
        centerTitle: true,
      ),
      body: const CardHome(),
    );
  }
}
