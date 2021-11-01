import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'colorDefs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technology Marketing Toolkit Quickbooks Configuration'),
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quickbooks Integration Configuration',
                style: TextStyle(fontSize: 24),
              ),
              Card(
                elevation: 10, // Change this
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(0),
                ),

                child: SizedBox(
                  width: 800,
                  height: 300,
                  child: SizedBox(
                    width: 800,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(48.0),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Welcome to the Technology Marketing Toolkit Quickbooks Integration. \nPlease login to Quickbooks using the button below to continue:',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Begin'),
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
                                  js.context.callMethod('open', [
                                    'https://mxoapptesting.azurewebsites.net/api/qbo/ConnectQBO',
                                    '_self'
                                  ]);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
