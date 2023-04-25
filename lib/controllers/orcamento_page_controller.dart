// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class OrcamentoPageController extends ChangeNotifier {
  final cub_referencial = TextEditingController();
  final area_atual = TextEditingController();

  var selectedValue = 1.25;
  var selectedValueK1 = 0.5;
  var selectedValueK2 = 1.0;
  var selectedValuek3 = 1.0;
  double? base;
  double? valorBase;
  double? valorTotalOrcamento;
  double anteprojeto = 0;
  double previsaoEtapasFuturas = 0;
  double baseAnteprojeto = 0;
  bool isCheckServicoExtras = false;
  bool isCheckPrevisaoEtapFuturas = false;
  bool isCheckAnteprojeto = false;
  bool isEnabledButton = false;

  checkCheckBox(bool? value) {
    if (valorBase != null) {
      isCheckServicoExtras = value!;
    }

    notifyListeners();
  }

  validateButton() {
    if (cub_referencial.text.isEmpty || area_atual.text.isEmpty) {
      isEnabledButton = false;
    } else {
      isEnabledButton = true;
    }
    notifyListeners();
  }

  List<DropdownMenuItem<double>> get dropDownTipicalIndicesItems {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 2.001, child: Text("Alvenaria térrea")),
      const DropdownMenuItem(
          value: 2.0012, child: Text("Alvenaria com mais de 1 pavimento")),
      const DropdownMenuItem(
          value: 1.25, child: Text("Alvenaria com 2 pavimentos iguais")),
      const DropdownMenuItem(value: 1.50, child: Text("Alvenaria com porão")),
      const DropdownMenuItem(value: 1.30, child: Text("Mista térrea")),
      const DropdownMenuItem(
          value: 0.8, child: Text("Mista com porão de alvenaria")),
      const DropdownMenuItem(
          value: 0.701, child: Text("Mista com 2 pavimentos")),
      const DropdownMenuItem(
          value: 1.00, child: Text("Mad. ou componente industrial")),
      const DropdownMenuItem(
          value: 0.7, child: Text("Mad. ou comp. ind. c/ porão de alvenaria")),
      const DropdownMenuItem(
          value: 1.40, child: Text("Ediculas ou pequenas garagens")),
    ];
    notifyListeners();
    return menuItens;
  }

  List<DropdownMenuItem<double>> get dropDownRepetitionOfFloors {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 1.00, child: Text("Sem")),
      const DropdownMenuItem(value: 0.75, child: Text("De 2 a 4")),
      const DropdownMenuItem(value: 0.501, child: Text("De 5 a 8")),
      const DropdownMenuItem(value: 0.50, child: Text("Acima de 8")),
    ];
    notifyListeners();
    return menuItens;
  }

  List<DropdownMenuItem<double>> get dropDownFinishingPattern {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 2.00, child: Text("Luxo")),
      const DropdownMenuItem(value: 1.5, child: Text("Alto")),
      const DropdownMenuItem(value: 1.0, child: Text("Normal")),
      const DropdownMenuItem(value: 0.50, child: Text("Baixo")),
      const DropdownMenuItem(value: 0.30, child: Text("Popular")),
    ];
    notifyListeners();
    return menuItens;
  }

  List<DropdownMenuItem<double>> get dropDownNeedsProgram {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 1.0, child: Text("Normal")),
      const DropdownMenuItem(value: 0.61, child: Text("Simples")),
      const DropdownMenuItem(value: 1.4, child: Text("Complexo")),
    ];
    notifyListeners();
    return menuItens;
  }

  getValue(double value) {
    selectedValue = value;
  }

  getValueK1(double value) {
    selectedValueK1 = value;
  }

  getValueK2(double value) {
    selectedValueK2 = value;
  }

  getValueK3(double value) {
    selectedValuek3 = value;
  }

  calcValorTotalOrcamento() {
    double convertCubReferencial = double.parse(cub_referencial.text
        .replaceAll('.', '')
        .trim()
        .replaceAll('R\$', '')
        .trim());
    double convertAreaAtual = double.parse(area_atual.text);
    base = selectedValue *
        (((selectedValueK1 + selectedValueK2 + selectedValuek3) / 3) *
            convertCubReferencial);
    valorBase = (base! / 100) + baseAnteprojeto;
    valorTotalOrcamento = (valorBase! * convertAreaAtual);
    notifyListeners();
  }

  calValorExtrasAnteprojeto(bool value) {
    if (value) {
      baseAnteprojeto = (valorBase! * 0.4);
    } else {
      anteprojeto = 0;
      baseAnteprojeto = 0;
    }
    notifyListeners();
  }

  calValorExtrasPrevisaoEtapasFuturas(bool value) {
    if (value) {
      previsaoEtapasFuturas =
          (valorTotalOrcamento! * 0.2) + valorTotalOrcamento!;
    } else {
      previsaoEtapasFuturas = 0;
    }
    notifyListeners();
  }
}
