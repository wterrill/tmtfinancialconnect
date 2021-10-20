import 'package:equatable/equatable.dart';
import 'dart:convert';

class BuildStructure extends Equatable {
  late dynamic data;
  late List<Map<String, double>> accounts;
  List<AccountData>? sales = [];
  List<AccountData>? costs = [];
  List<AccountData>? expenses = [];
  List<AccountData>? all = [];

  BuildStructure(
      {this.data,
      required this.accounts,
      this.sales,
      this.costs,
      this.expenses});

  BuildStructure.fromJson(String urlString) {
    data = json.decode(urlString);
    print('------------------- - - - - - - -');
    print(urlString);
    print(data);

    print('------------------- - - - - - - -');
    print('%%%%%%%%%%%%%%%%%');
    dynamic salesx = data['Sales'];
    for (dynamic sale in salesx) {
      AccountData acct =
          AccountData(sale['ItemText'], sale['ItemVal'], sale['Mapping']);
      this.sales?.add(acct);
      this.all?.add(acct);
    }
    dynamic costsx = data['Costs'];
    for (dynamic cost in costsx) {
      AccountData acct =
          AccountData(cost['ItemText'], cost['ItemVal'], cost['Mapping']);
      this.costs?.add(acct);
      this.all?.add(acct);
    }
    dynamic expensesx = data['Expenses'];
    for (dynamic expense in expensesx) {
      AccountData acct = AccountData(
          expense['ItemText'], expense['ItemVal'], expense['Mapping']);
      this.expenses?.add(acct);
      this.all?.add(acct);
    }

    print(this.sales.toString());
    print(this.costs.toString());
    print(this.expenses.toString());
    print(this.all.toString());
    print('%%%%%%%%%%%%%%%%%');
  }

  String toJson() {
    print('!!!!!!!!!!!!!!!!');
    print(data);
    // {
    // realmId: 9130351527639376,
    // Sales: [
    //   {Id: 3, RealmId: 0, ItemId: 5, ItemText: Sales, ItemVal: 125650, Mapping: 3}],
    //   Costs: [{Id: 6, RealmId: 0, ItemId: 93, ItemText: Cost of labor - COGS, ItemVal: 13000, Mapping: 3},
    //   {Id: 7, RealmId: 0, ItemId: 96, ItemText: Supplies & materials - COGS, ItemVal: 30005, Mapping: 3}],
    //   Expenses: [{Id: 12, RealmId: 0, ItemId: 18, ItemText: Business licenses, ItemVal: 3500, Mapping: 3},
    //   {Id: 7, RealmId: 0, ItemId: 32, ItemText: Entertainment, ItemVal: 10742, Mapping: 3},
    //   {Id: 14, RealmId: 0, ItemId: 115, ItemText: Travel meals, ItemVal: 33333.33, Mapping: 3},
    //   {Id: 9, RealmId: 0, ItemId: 122, ItemText: Salaries & wages, ItemVal: 20333, Mapping: 3}]}
    dynamic newData = data;
    print(data.runtimeType);
    if (sales != null && sales!.length > 0) {
      int i = 0;
      for (AccountData sale in sales!) {
        newData!['Sales'][i]['Mapping'] = sale.map;
        i = i + 1;
      }
    }
    if (costs != null && costs!.length > 0) {
      int i = 0;
      for (AccountData cost in costs!) {
        newData!['Costs'][i]['Mapping'] = cost.map;
        i = i + 1;
      }
    }
    if (expenses != null && expenses!.length > 0) {
      int i = 0;
      for (AccountData expense in expenses!) {
        newData!['Expenses'][i]['Mapping'] = expense.map;
        i = i + 1;
      }
    }

    print('!!!!!!!!!!!!!!!!');
    return newData;
  }
  // factory BuildStructure.fromJson(Map<String, dynamic> json) {
  //   return BuildStructure(userId: json['userId'], id: json['id'], title: json['title']);
  // }

  List<Object> get props {
    return [data, this];
  }
}

class AccountData extends Equatable {
  final String name;
  final double value;
  int? map;

  AccountData(this.name, this.value, this.map);

  List<Object> get props {
    return [name, value];
  }

  @override
  String toString() {
    return ('name: $name, value: $value, map: $map');
    // return super.toString();
  }
}
