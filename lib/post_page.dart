import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:tmtfinancialconnect/financial_dashboard.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    // print(data);
    // JsonEncoder encoder = new JsonEncoder.withIndent('    ');
    // String prettyprint = encoder.convert(data);
    // print(prettyprint);
    dynamic jsonData = json.decode(data);
    print(jsonData);
    // JsonEncoder encoder = new JsonEncoder.withIndent('    ');
    // String prettyprint = encoder.convert(jsonData);

    // prettyprint.split('\n').forEach((element) => print(element));
    return Scaffold(
      appBar: AppBar(
        title: Text('post page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FinancialDashboard(),
            SelectableText(json.decode(data).toString()),
          ],
        ),
      ),
    );
  }
}
