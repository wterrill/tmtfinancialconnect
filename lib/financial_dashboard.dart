import 'package:flutter/material.dart';
import 'package:tmtfinancialconnect/account_map.dart';
import 'package:tmtfinancialconnect/configuration.dart';
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context, 'Show Help', 'Needs Help'),
                    );
                  },
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
                                    GestureDetector(
                                      child: FaIcon(
                                          FontAwesomeIcons.questionCircle),
                                      onTap: () {
                                        print('hello');
                                        print(
                                            '$index tapped: ${finalStructure?.all?[index].map}');
                                        print(
                                            '${itemArray[finalStructure?.all?[index].map as int]}');
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              _buildPopupDialog(
                                                  context,
                                                  '${itemArray[finalStructure?.all?[index].map as int]}',
                                                  'Category Help'),
                                        );
                                      },
                                    ),
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

Widget _buildPopupDialog(BuildContext context, String data, String heading) {
  return new AlertDialog(
    title: Text(heading),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(data),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
