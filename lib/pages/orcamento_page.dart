import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:orcamentos_obras/controllers/orcamento_page_controller.dart';

class CriarOrcamentoPage extends StatefulWidget {
  const CriarOrcamentoPage({super.key});

  @override
  State<CriarOrcamentoPage> createState() => _CriarOrcamentoPageState();
}

class _CriarOrcamentoPageState extends State<CriarOrcamentoPage> {
  OrcamentoPageController orcamentoPageController = OrcamentoPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Valores Típicos de Índices'),
          DropdownButton(
            value: orcamentoPageController.selectedValue,
            items: orcamentoPageController.dropDownTipicalIndicesItems,
            onChanged: (double? value) {
              setState(() {
                orcamentoPageController.selectedValue = value!;
                orcamentoPageController.getValue(value);
              });
            },
          ),
          const Text('Repetição de Pavimentos - K1'),
          DropdownButton(
              value: orcamentoPageController.selectedValueK1,
              items: orcamentoPageController.dropDownRepetitionOfFloors,
              onChanged: (double? valueK1) {
                setState(() {
                  orcamentoPageController.selectedValueK1 = valueK1!;
                  orcamentoPageController.getValueK1(valueK1);
                });
              }),

          const Text('Padrão de Acabamento - K2'),
          DropdownButton(
              value: orcamentoPageController.selectedValueK2,
              items: orcamentoPageController.dropDownFinishingPattern,
              onChanged: (double? valuek2) {
                setState(() {
                  orcamentoPageController.selectedValueK2 = valuek2!;
                  orcamentoPageController.getValueK2(valuek2);
                });
              }),

          const Text('Programa de Necessidades - K3'),
          DropdownButton(
              value: orcamentoPageController.selectedValuek3,
              items: orcamentoPageController.dropDownNeedsProgram,
              onChanged: (double? valuek3) {
                setState(() {
                  orcamentoPageController.selectedValuek3 = valuek3!;
                  orcamentoPageController.getValueK3(valuek3);
                });
              }),
          const Text('Indice Corrigido'),
          AnimatedBuilder(
            animation: orcamentoPageController,
            builder: (context, child) => Container(
              child: orcamentoPageController.indiceConvertidoString != null
                  ? Text(
                      orcamentoPageController.indiceConvertidoString.toString())
                  : Container(),
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   child: TextField(
          //     controller: orcamentoController.cub_referencial,
          //     keyboardType: TextInputType.number,
          //     inputFormatters: [
          //       FilteringTextInputFormatter.digitsOnly,
          //       RealInputFormatter(moeda: true),
          //     ],
          //     decoration: InputDecoration(
          //       labelText: 'C.U.B. Referencial',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(6),
          //       ),
          //     ),
          //   ),
          // ),
          TextButton(
              onPressed: () {
                orcamentoPageController.calcIndiceCorrigido();
              },
              child: Text('clica'))
        ],
      ),
    );
  }
}
