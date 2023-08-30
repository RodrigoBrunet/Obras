import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamentos_obras/config/routes/routes.dart';
import 'package:orcamentos_obras/controllers/orcamento_page_controller.dart';
import 'package:orcamentos_obras/utils/constants/strings/string_text.dart';
import 'package:orcamentos_obras/utils/constants/styles/text_style.dart';

class CriarOrcamentoPage extends StatefulWidget {
  const CriarOrcamentoPage({super.key});

  @override
  State<CriarOrcamentoPage> createState() => _CriarOrcamentoPageState();
}

class _CriarOrcamentoPageState extends State<CriarOrcamentoPage> {
  OrcamentoPageController orcamentoPageController = OrcamentoPageController();
  final ButtonStyle style =
      ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARQUITETÔNICO'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Modular.to.navigate(NamedRoutes.HOMEPAGE),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Center(
              child: Text(titleText, textAlign: TextAlign.center, style: h3),
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
                  maxLength: 9,
                  controller: orcamentoPageController.cub_referencial,
                  keyboardType: TextInputType.number,
                  onChanged: orcamentoPageController.validateButton(),
                  decoration: InputDecoration(
                      counterText: '',
                      hintText: '1.500.00',
                      labelText: 'C.U.B. referêncial',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RealInputFormatter(),
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
                  maxLength: 8,
                  controller: orcamentoPageController.area_atual,
                  keyboardType: TextInputType.number,
                  onChanged: orcamentoPageController.validateButton(),
                  decoration: InputDecoration(
                      counterText: '',
                      hintText: '200',
                      labelText: 'Área Atual (m²)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
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
                                value: orcamentoPageController
                                    .isCheckPrevisaoEtapFuturas,
                                onChanged: (bool? value) {
                                  orcamentoPageController
                                      .isCheckPrevisaoEtapFuturas = value!;
                                  orcamentoPageController
                                      .calValorExtrasPrevisaoEtapasFuturas(
                                          value);
                                },
                              ),
                              const Text('Previsão de etapas futuras'),
                              Checkbox(
                                value:
                                    orcamentoPageController.isCheckAnteprojeto,
                                onChanged: (bool? value) {
                                  orcamentoPageController.isCheckAnteprojeto =
                                      value!;
                                  orcamentoPageController
                                      .calValorExtrasAnteprojeto(value);
                                },
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Total do orçamento',
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
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.grey.shade200,
                          child: Text(
                            UtilBrasilFields.obterReal(
                                orcamentoPageController.valorTotalOrcamento!),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.grey.shade200,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedBuilder(
              animation: orcamentoPageController,
              builder: (context, child) => Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Base',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 116,
                  ),
                  orcamentoPageController.valorBase != null
                      ? Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.grey.shade200,
                          child: Text(
                            UtilBrasilFields.obterReal(
                                orcamentoPageController.valorBase!),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.grey.shade200,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
              child: AnimatedBuilder(
                animation: orcamentoPageController,
                builder: (context, child) => orcamentoPageController
                            .isEnabledButton ==
                        true
                    ? ElevatedButton(
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
                        ),
                      )
                    : ElevatedButton(
                        style: style,
                        onPressed: null,
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
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
