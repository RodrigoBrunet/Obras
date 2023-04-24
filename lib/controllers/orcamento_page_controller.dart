// ignore_for_file: non_constant_identifier_names

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class OrcamentoPageController extends ChangeNotifier {
  final cub_referencial = TextEditingController();
  final area_atual = TextEditingController();

  var selectedValue = 1.25;
  var selectedValueK1 = 0.5;
  var selectedValueK2 = 1.0;
  var selectedValuek3 = 1.0;
  double? indiceCorrigido;
  double? valorMetroQuadrado;
  double? base;
  double? valorBase;
  double? valorTotalOrcamento;
  String? totalOrcamento;
  String? valorMetroString;

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
      const DropdownMenuItem(value: 1.00, child: Text("sem")),
      const DropdownMenuItem(value: 0.75, child: Text("de 2 a 4")),
      const DropdownMenuItem(value: 0.501, child: Text("de 5 a 8")),
      const DropdownMenuItem(value: 0.50, child: Text("acima de 8")),
    ];
    notifyListeners();
    return menuItens;
  }

  List<DropdownMenuItem<double>> get dropDownFinishingPattern {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 2.00, child: Text("luxo")),
      const DropdownMenuItem(value: 1.5, child: Text("alto")),
      const DropdownMenuItem(value: 1.0, child: Text("normal")),
      const DropdownMenuItem(value: 0.50, child: Text("baixo")),
      const DropdownMenuItem(value: 0.30, child: Text("popular")),
    ];
    notifyListeners();
    return menuItens;
  }

  List<DropdownMenuItem<double>> get dropDownNeedsProgram {
    List<DropdownMenuItem<double>> menuItens = [
      const DropdownMenuItem(value: 1.0, child: Text("normal")),
      const DropdownMenuItem(value: 0.61, child: Text("simples")),
      const DropdownMenuItem(value: 1.4, child: Text("complexo")),
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
    double convert = double.parse(cub_referencial.text);
    double convertArea = double.parse(area_atual.text);
    base = selectedValue *
        (((selectedValueK1 + selectedValueK2 + selectedValuek3) / 3) * convert);
    valorBase = base! / 100;
    valorMetroString = valorBase?.toStringAsFixed(2);
    valorTotalOrcamento = valorBase! * convertArea;

    notifyListeners();
  }
}
