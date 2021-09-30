import 'package:flutter/material.dart';
import 'package:tmtfinancialconnect/account_map.dart';
import 'package:tmtfinancialconnect/drop_down_map.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinancialDashboard extends StatelessWidget {
  const FinancialDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    AccountMap account_map1 = AccountMap(
        name: 'IT Project Revenue',
        lastMonth: DateTime(date.year, date.month - 1, date.day),
        lastMonthValue: 102991.39);

    AccountMap account_map2 = AccountMap(
        name: 'MSP Revenue',
        lastMonth: DateTime.now(),
        lastMonthValue: 123671.88);

    AccountMap account_map3 = AccountMap(
        name: 'App Dev Revenue',
        lastMonth: DateTime.now(),
        // DateTime.parse(
        //     Jiffy().startOf(Units.MONTH).subtract(months: 1).format('MM')),
        lastMonthValue: 98340.41);
    List<AccountMap> accounts = [account_map1, account_map2, account_map3];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Financial Dashboard Report Mapping',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 50),
                FlatButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  child: new Text('Need Help?',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Please select the correct line item for each of your accounts'),
                    SizedBox(height: 50),
                    Row(children: [
                      Spacer(flex: 1),
                      Expanded(flex: 2, child: Text('Accounts')),
                      Expanded(
                        flex: 1,
                        child: Text(
                            DateFormat('MMM y').format(accounts[0].lastMonth)),
                      ),
                      Expanded(flex: 1, child: Text('Map To')),
                      Spacer(flex: 1)
                    ]),
                    Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: accounts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(children: [
                              Spacer(flex: 1),
                              Expanded(
                                  flex: 2, child: Text(accounts[index].name)),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      '\$${accounts[index].lastMonthValue.toString()}')),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    DropDownMap(
                                      lastMap: 0,
                                    ),
                                    FaIcon(FontAwesomeIcons.questionCircle),
                                  ],
                                ),
                              ),
                              Spacer(flex: 1)
                            ]);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
