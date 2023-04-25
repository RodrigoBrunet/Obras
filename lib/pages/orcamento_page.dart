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
      appBar: AppBar(
        title: const Text('ARQUITETÔNICO'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                'Valores Típicos de Índices',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: DropdownButton(
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                value: orcamentoPageController.selectedValue,
                items: orcamentoPageController.dropDownTipicalIndicesItems,
                onChanged: (double? value) {
                  setState(() {
                    orcamentoPageController.selectedValue = value!;
                    orcamentoPageController.getValue(value);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                'Repetição de Pavimentos - K1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: DropdownButton(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  value: orcamentoPageController.selectedValueK1,
                  items: orcamentoPageController.dropDownRepetitionOfFloors,
                  onChanged: (double? valueK1) {
                    setState(() {
                      orcamentoPageController.selectedValueK1 = valueK1!;
                      orcamentoPageController.getValueK1(valueK1);
                    });
                  }),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                'Padrão de Acabamento - K2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: DropdownButton(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  value: orcamentoPageController.selectedValueK2,
                  items: orcamentoPageController.dropDownFinishingPattern,
                  onChanged: (double? valuek2) {
                    setState(() {
                      orcamentoPageController.selectedValueK2 = valuek2!;
                      orcamentoPageController.getValueK2(valuek2);
                    });
                  }),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(
                'Programa de Necessidades - K3',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: DropdownButton(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  value: orcamentoPageController.selectedValuek3,
                  items: orcamentoPageController.dropDownNeedsProgram,
                  onChanged: (double? valuek3) {
                    setState(() {
                      orcamentoPageController.selectedValuek3 = valuek3!;
                      orcamentoPageController.getValueK3(valuek3);
                    });
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: orcamentoPageController.cub_referencial,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '1.500.00',
                      labelText: 'C.U.B. referêncial',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //RealInputFormatter(moeda: true),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: orcamentoPageController.area_atual,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '200',
                      labelText: 'Área Atual (m²)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //RealInputFormatter(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                AnimatedBuilder(
                  animation: orcamentoPageController,
                  builder: (context, child) => Checkbox(
                    value: orcamentoPageController.isCheckServicoExtras,
                    onChanged: (bool? value) {
                      orcamentoPageController.checkCheckBox(value);
                    },
                  ),
                ),
                const Text(
                  'Serviços Extras',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            AnimatedBuilder(
              animation: orcamentoPageController,
              builder: (context, child) => orcamentoPageController
                          .isCheckServicoExtras ==
                      true
                  ? Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Previsão de etapas futuras'),
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Anteprojeto'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text(
                                  'Levantamento de instalações existentes'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Perspectivas e/ou Maquetes'),
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Orçamentação'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Tratamentos de espaços abertos'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Elaboração de relação de materiais'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Planta de vendas número de pranchas'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text(
                                  'Detalhe pormenorizado de esquadrias de número'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text('Reforma com ampliação'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (_) {},
                              ),
                              const Text(
                                  'Elaboração de planilhas da NB140 tabela 6.2'),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedBuilder(
              animation: orcamentoPageController,
              builder: (context, child) => Row(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Valor total do orçamento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      orcamentoPageController.valorTotalOrcamento != null
                          ? Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.40,
                              color: Colors.grey.shade200,
                              child: Text(
                                UtilBrasilFields.obterReal(
                                    orcamentoPageController
                                        .valorTotalOrcamento!),
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w500),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.40,
                              color: Colors.grey.shade200,
                            ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    orcamentoPageController.calcValorTotalOrcamento();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 14, bottom: 14),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.84,
                    child: const Text(
                      'CALCULAR VALOR TOTAL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            // const Text('Base'),
            // AnimatedBuilder(
            //   animation: orcamentoPageController,
            //   builder: (context, child) => Container(
            //     child: orcamentoPageController.valorMetroString != null
            //         ? Text(orcamentoPageController.valorMetroString.toString())
            //         : Container(),
            //   ),
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
            // const Text('valor total orcamento'),
            // const SizedBox(
            //   height: 16,
            // ),
          ],
        ),
      ),
    );
  }
}
