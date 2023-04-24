import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              child: orcamentoPageController.valorMetroString != null
                  ? Text(orcamentoPageController.valorMetroString.toString())
                  : Container(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                const Text('C.U.B. Referencial'),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: TextField(
                    controller: orcamentoPageController.cub_referencial,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      //RealInputFormatter(moeda: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                const Text('Área Atual (m2)'),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: TextField(
                    controller: orcamentoPageController.area_atual,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      //RealInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('valor total orcamento'),
          const SizedBox(
            height: 16,
          ),
          AnimatedBuilder(
            animation: orcamentoPageController,
            builder: (context, child) =>
                orcamentoPageController.totalOrcamento != null
                    ? Text(
                        UtilBrasilFields.obterReal(
                            orcamentoPageController.valorTotalOrcamento!),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      )
                    : const Text('calculando...'),
          ),
          TextButton(
              onPressed: () {
                orcamentoPageController.calcValorTotalOrcamento();
              },
              child: Text('clica'))
        ],
      ),
    );
  }
}
