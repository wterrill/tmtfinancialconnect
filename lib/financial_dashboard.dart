import 'package:flutter/material.dart';
import 'package:tmtfinancialconnect/account_map.dart';
import 'package:tmtfinancialconnect/drop_down_map.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tmtfinancialconnect/post_page.dart';

import 'buildStructure.dart';

class FinancialDashboard extends StatelessWidget {
  const FinancialDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

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
                        child: Text(DateFormat('MMM y').format(
                            DateTime(date.year, date.month - 1, date.day))),
                      ),
                      Expanded(flex: 1, child: Text('Map To')),
                      Spacer(flex: 1)
                    ]),
                    Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: finalStructure?.all?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(children: [
                              Spacer(flex: 1),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                      finalStructure?.all![index].name ??
                                          'error')),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      '\$${finalStructure?.all?[index].value.toString()}')),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    DropDownMap(
                                      index: index,
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
