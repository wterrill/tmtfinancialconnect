import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmtfinancialconnect/buildStructure.dart';
import 'dart:convert';

import 'package:tmtfinancialconnect/financial_dashboard.dart';

import 'http_api.dart';

BuildStructure? finalStructure;

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    // BuildStructure buildStructure = BuildStructure.fromJson(data);
    finalStructure = BuildStructure.fromJson(data);

    return Scaffold(
      appBar: AppBar(
        title: Text('post page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FinancialDashboard(),
            TextButton(
                onPressed: () {
                  print('pressed');
                  HttpApi http = HttpApi();
                  dynamic beer = http.postData('title');
                  beer.then((Response val) {
                    print('%%%%%%%%%%%%-------');
                    print('response from server received');
                    print(val.body);
                    print('%%%%%%%%%%%%-------');
                  });
                },
                child: Text('Submit')),
            SelectableText(json.decode(data).toString()),
          ],
        ),
      ),
    );
  }
}
