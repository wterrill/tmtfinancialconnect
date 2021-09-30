import 'package:flutter/material.dart';
import 'dart:js' as js;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text('Open Quickbooks Authenticationn'),
              onPressed: () {
                js.context.callMethod('open', [
                  // 'https://quickbooksrestfulapi.azure-api.net/api/qbo/ConnectQBO',
                  'https://mxoapptesting.azurewebsites.net/api/qbo/ConnectQBO',
                  '_self'
                ]); //<= find explanation below
              },
            ),
          ],
        ),
      ),
    );
  }
}
