class HistoryRepository {
  List<String> hist = [];
  List<String> addImc(String imc) {
    hist.add(imc);
    return hist;
  }

  List<String> listHistory() {
    return hist;
  }
}
