import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tmtfinancialconnect/buildStructure.dart';
import 'dart:convert';

import 'package:tmtfinancialconnect/financial_dashboard.dart';

import 'colorDefs.dart';
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
        title: Text('Quickbooks Configuration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FinancialDashboard(),
            TextButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Submit'),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: ColorDefs.buttonBackground,
                shadowColor: Colors.black,
                elevation: 5,
                side: BorderSide(color: Colors.red, width: 1),
                textStyle: const TextStyle(fontSize: 20),
              ),
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
            ),

            // SelectableText(json.decode(data).toString()),
          ],
        ),
      ),
    );
  }
}
