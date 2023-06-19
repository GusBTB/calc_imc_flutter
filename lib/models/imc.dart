class Imc {
  double weigth = 0;
  double height = 0;
  Imc(this.weigth, this.height);
  String calculateImc() {
    String result = "";
    double imc = weigth / (height * height);
    result += imc.toStringAsFixed(2);
    if (imc < 16) {
      result += ", magreza grave";
    } else if (imc < 17) {
      result += ", magreza moderada";
    } else if (imc < 18.5) {
      result += ", magreza leve";
    } else if (imc < 25) {
      result += ", saudável";
    } else if (imc < 30) {
      result += ", sobrepeso";
    } else if (imc < 35) {
      result += ", obesidade grau 1";
    } else if (imc < 40) {
      result += ", obesidade grau 2 (severa)";
    } else {
      result += ", obesidade grau 3 (mórbida)";
    }
    return result;
  }
}
