class AccountMap {
  String name;
  DateTime lastMonth;
  double lastMonthValue;
  int mapTo;

  AccountMap(
      {required this.name,
      required this.lastMonth,
      required this.lastMonthValue,
      this.mapTo = 0}) {
    name = this.name;
    lastMonth = this.lastMonth;
    lastMonthValue = this.lastMonthValue;
    mapTo = this.mapTo;
  }
}
